import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserService {
  static final _db = FirebaseFirestore.instance;

  // READ
  static Stream<List<Map<String, dynamic>>> getUsers() {
    return _db
        .collection('users')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) {
          return snap.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return data;
          }).toList();
        });
  }

  // INSERT / UPDATE
  static Future<void> saveUser({
    String? id,
    required String ndepan,
    required String nbelakang,
    required String email,
    required String username,
    String? photoPath,
  }) async {
    final data = {
      'nama_depan': ndepan,
      'nama_belakang': nbelakang,
      'email': email,
      'username': username,
      'photoPath': photoPath ?? '',
    };

    if (id == null) {
      await _db.collection('users').add({
        ...data,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } else {
      await _db.collection('users').doc(id).update(data);
    }
  }

  // DELETE
  static Future<void> deleteUser(String id) async {
    await _db.collection('users').doc(id).delete();
  }
}
