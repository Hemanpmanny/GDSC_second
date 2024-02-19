import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addEmployeeDetailes(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("employees")
        .doc(id)
        .set(employeeInfoMap);
  }

  Stream<QuerySnapshot> getEmployeeDetailes() {
    return FirebaseFirestore.instance.collection("employees").snapshots();
  }

  Future UpdateEmployeeDetailes(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("employees")
        .doc(id)
        .update(updateInfo);
  }

  Future DeleteEmployeeDetailes(String id) async {
    return await FirebaseFirestore.instance
        .collection("employees")
        .doc(id)
        .delete();
  }
}
// FirebaseFirestore.instance: This gets the singleton instance of FirebaseFirestore, which is the entry point for interacting with a Firestore database.
// .collection("employees"): This accesses the 'employees' collection in the Firestore database.
// .snapshots(): This listens to the 'employees' collection and returns a Stream of QuerySnapshot. Each QuerySnapshot contains the current state of the 'employees' collection at the time of the event.
// QuerySnapshot is a type from Firestore that contains the results of a query.
