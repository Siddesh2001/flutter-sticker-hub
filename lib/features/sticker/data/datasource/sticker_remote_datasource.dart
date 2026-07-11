import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
