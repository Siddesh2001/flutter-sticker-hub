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

    final pack = StickerPackModel(
      id: doc.id,
      name: name,
      author: author,
      createdAt: DateTime.now(),
      stickerCount: 0,
      coverImage: '',
    );

    await doc.set(pack.toMap());
  }

  Future<List<StickerPackModel>> getStickerPacks() async {
    final snapshot = await _packCollection
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => StickerPackModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> deletePack(String id) async {
    await _packCollection.doc(id).delete();
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

      final sticker = StickerModel(
        id: stickerDoc.id,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      debugPrint("STEP 3");

      await stickerDoc.set(sticker.toMap());

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
}
