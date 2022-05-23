import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShowFireData extends StatefulWidget {
  const ShowFireData({Key? key}) : super(key: key);

  @override
  _ShowFireDataState createState() => _ShowFireDataState();
}

class _ShowFireDataState extends State<ShowFireData> {
  // DatabaseReference firebaseRef = FirebaseDatabase.instance.ref("Registered Users");

  List<String> showDatas = [];
  List<Map<dynamic, dynamic>> showData = [];





  Future getDataTest() async {
    DatabaseReference starCountRef =
    FirebaseDatabase.instance.ref("Registered Users");
    starCountRef.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
      data!.forEach((key, values) {
            showData.add(data);
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataTest();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Realtime Data Show"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getDataTest(),
          // future: firebaseRef.once(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (snapshot.hasData) {
            //   showData.clear();
            //   Map<dynamic, dynamic> values = snapshot.data!.value;
            //   // Map<dynamic, dynamic>? values = snapshot.data!.value as Map?;
            //   values.forEach((key, values) {
            //     showData.add(values);
            //   });
            //
            //   return ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: showData.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //           margin: EdgeInsets.all(20),
            //           child: Column(
            //             children: [
            //               Text("User Name: " + showData[index]['name']),
            //               Text("User email: " + showData[index]['email']),
            //               Text("User phone: " + showData[index]['phone']),
            //               Text("User address: " + showData[index]['address']),
            //             ],
            //           ),
            //         );
            //       });
            // }

            return Center(
              // child: CircularProgressIndicator(),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: showData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("User Name: " + showData[index]['name']),
                          Text("User email: " + showData[index]['email']),
                          Text("User phone: " + showData[index]['phone']),
                          Text("User address: " + showData[index]['address']),
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}