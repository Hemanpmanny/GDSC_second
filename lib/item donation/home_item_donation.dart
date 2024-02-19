import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groupchat/item%20donation/database.dart';
import 'package:groupchat/item%20donation/employee.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key});

  @override
  State<HomeItem> createState() => _HomeState();
}

class _HomeState extends State<HomeItem> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  Stream<QuerySnapshot>? employeeStream;
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController currentontroller = TextEditingController();
  TextEditingController needcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    employeeStream = DataBaseMethods().getEmployeeDetailes();
  }

  Widget allEmployeeDetailes() {
    return StreamBuilder(
        stream: employeeStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Container(
              child: Text("No data"),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data!.docs[index];

                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border:
                          Border.all(color: Color.fromARGB(206, 226, 224, 224)),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Color.fromARGB(255, 223, 222, 222))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Center(
                          //   child: Container(
                          //     height: 150,
                          //     width: 150,
                          //     child: (ds.data() as Map<String, dynamic>)
                          //                 .containsKey('IamgeURL') &&
                          //             ds['IamgeURL'] != null
                          //         ? Image.network(
                          //             '${ds['IamgeURL']}',
                          //             fit: BoxFit.cover, // Added this
                          //           )
                          //         : Container(),
                          //   ),
                          // ),

                          Center(
                            child: CircleAvatar(
                              radius:
                                  70, // Increase this value to make the image larger
                              backgroundImage: NetworkImage(ds['IamgeURL']),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name: " + ds["Name"],
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                const Spacer(),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Age: " + ds["Age"],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Phone " + ds["Phone"],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Location: " + ds["Location"],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Current items: " + ds["CurrentItems"],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Need Items: " + ds["NeedItems"],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    namecontroller.text = ds["Name"];
                                    agecontroller.text = ds["Age"];
                                    locationcontroller.text = ds["Location"];
                                    EditEmployeeDetailes(ds["ID"]);
                                  },
                                  child: const ElevatedButton(
                                      onPressed: null,
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18),
                                      ))),
                              const SizedBox(
                                width: 13,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await DataBaseMethods()
                                        .DeleteEmployeeDetailes(ds["ID"])
                                        .then((value) {
                                      Fluttertoast.showToast(
                                          msg: "Person called  " +
                                              ds["Name"] +
                                              " Deleted Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  },
                                  child: const ElevatedButton(
                                      onPressed: null,
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 18),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const employee()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gadget",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text(
              "Donation",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetailes()),
          ],
        ),
      ),
    );
  }

  Future EditEmployeeDetailes(String id) => showDialog(
      context: context,
      builder: (content) => AlertDialog(
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.cancel, color: Colors.red)),
                        SizedBox(
                          width: 60,
                        ),
                        const Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const Text(
                          "Detailes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: namecontroller,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Age",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: agecontroller,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Location",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: locationcontroller,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> updateInfo = {
                            "Name": namecontroller.text,
                            "Age": agecontroller.text,
                            "ID": id,
                            "Location": locationcontroller.text
                          };
                          await DataBaseMethods()
                              .UpdateEmployeeDetailes(id, updateInfo)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Update",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
