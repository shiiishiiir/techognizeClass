import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FireHomeStore extends StatefulWidget {
  const FireHomeStore({Key? key}) : super(key: key);

  @override
  State<FireHomeStore> createState() => _FireHomeStoreState();
}

class _FireHomeStoreState extends State<FireHomeStore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  _saveUsers() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    nameController.clear();
    emailController.clear();

    if (name != "" && email != "") {
      Map<String, dynamic> userData = {"name": name, "email": email};
      FirebaseFirestore.instance.collection("Users").add(userData);
      print("Success");
    } else {
      return "Fill All the Fields";
    }
  }

  Future _exitDialogue() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are You Sure ?"),
        content: Text("Do you really want to exit ?"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text("EXIT")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("CANCEL")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialogue();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Verified Home Page "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Input Name",
                ),
                controller: nameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Input Email",
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  _saveUsers();
                },
                child: Text("Submit"),
                color: Colors.indigoAccent,
              ),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> userMap =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                              return ListTile(
                                title: Text(userMap["name"]),
                                subtitle: Text(userMap["email"]),
                              );
                            }),
                      );
                    } else {
                      return Text("No data ");
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
