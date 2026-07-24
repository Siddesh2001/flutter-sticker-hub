import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_sticker/features/sticker/data/model/sticker_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/sticker_pack_model.dart';

class StickerRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  StickerRemoteDataSource({
    required this.firestore,
    required this.firebaseAuth,
  });

  CollectionReference<Map<String, dynamic>> get _packCollection {
    final uid = firebaseAuth.currentUser!.uid;

    return firestore.collection('users').doc(uid).collection('sticker_packs');
  }

  Future<void> createPack({
    required String name,
    required String author,
  }) async {
    final doc = _packCollection.doc();

    final now = DateTime.now();

    final pack = StickerPackModel(
      id: doc.id,
      name: name,
      author: author,
      coverImageCloudUrl: '',
      coverImageLocalPath: '',
      stickerCount: 0,
      createdAt: now,
      updatedAt: now,
      isSynced: true,
      lastSynced: now,
    );

    await doc.set(pack.toMap());
  }

  Future<void> renamePack({
    required String packId,
    required String newName,
  }) async {
    await _packCollection.doc(packId).update({'name': newName});
  }

  Future<List<StickerPackModel>> getStickerPacks() async {
    final snapshot = await _packCollection
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => StickerPackModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> deleteSticker({
    required String packId,
    required String stickerId,
  }) async {
    await _packCollection
        .doc(packId)
        .collection('stickers')
        .doc(stickerId)
        .delete();

    await _packCollection.doc(packId).update({
      'stickerCount': FieldValue.increment(-1),
    });
  }

  Future<void> addSticker({
    required String packId,
    required String imageUrl,
  }) async {
    try {
      debugPrint("========== ADD STICKER ==========");
      debugPrint("STEP 1");
      debugPrint("Pack ID: $packId");

      final stickerDoc = _packCollection
          .doc(packId)
          .collection('stickers')
          .doc();
      debugPrint("Sticker path: ${stickerDoc.path}");

      debugPrint("STEP 2");
      debugPrint("Sticker Doc ID: ${stickerDoc.id}");

      final now = DateTime.now();

      final sticker = StickerModel(
        id: stickerDoc.id,
        cloudUrl: imageUrl,
        localPath: '',
        createdAt: now,
        isDownloaded: false,
        isSynced: true,
        lastSynced: now,
      );

      debugPrint("STEP 3");

      await stickerDoc.set(sticker.toMap());
      final packDoc = _packCollection.doc(packId);

      final packSnapshot = await packDoc.get();

      final currentCover = packSnapshot.data()?['coverImage'] ?? '';

      if (currentCover.isEmpty) {
        await packDoc.update({'coverImage': imageUrl});
      }

      debugPrint("STEP 4 - Sticker document created");

      await _packCollection.doc(packId).update({
        'stickerCount': FieldValue.increment(1),
      });

      debugPrint("STEP 5 - Sticker count updated");
    } catch (e, st) {
      debugPrint("ADD STICKER ERROR: $e");
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  Future<void> deletePack(String packId) async {
    await _packCollection.doc(packId).delete();
  }

  Future<List<StickerModel>> getStickers(String packId) async {
    final snapshot = await _packCollection
        .doc(packId)
        .collection('stickers')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => StickerModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> setCoverImage({
    required String packId,
    required String imageUrl,
  }) async {
    await _packCollection.doc(packId).update({'coverImage': imageUrl});
  }
}
