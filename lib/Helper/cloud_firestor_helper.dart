import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestorHelper {
  CloudFirestorHelper._();

  static CloudFirestorHelper cloudfirestorhelper = CloudFirestorHelper._();
  static FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> insert({required Map<String, dynamic> data}) async {
    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection("counter").doc("users_counter").get();
    int id = counter['id'];
    int length = counter['length'];

    await db.collection("users").doc("${++id}").set(data);

    await db.collection("counter").doc("users_counter").update({"id": id});

    await db
        .collection("counter")
        .doc("users_counter")
        .update({"length": ++length});
  }

  delete({required String id}) async {
    await db.collection("users").doc(id).delete();

    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection("counter").doc("users_counter").get();
    int length = counter['length'];

    await db
        .collection("counter")
        .doc("users_counter")
        .update({"length": --length});
  }

  update({required String id}) async {
    await db.collection("users").doc(id).update({"name": "Jay"});
  }


  // deleteUser({required String uid})async{
  //   await db.collection("users").doc(uid).delete();
  // }
}
