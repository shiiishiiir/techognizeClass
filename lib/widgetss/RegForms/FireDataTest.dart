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
      data?.forEach((key, values) {
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

class MyShowRealTDB extends StatefulWidget {
  const MyShowRealTDB({Key? key}) : super(key: key);

  @override
  State<MyShowRealTDB> createState() => _MyShowRealTDBState();
}

class _MyShowRealTDBState extends State<MyShowRealTDB> {
  // DatabaseReference firebaseRef = FirebaseDatabase.instance.ref("Registered Users");
  final showss =[];

  getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("Registered Users").get();
    if (snapshot.exists) {
      // return ListView.builder(
      //
      //     itemBuilder: (context, snapshot){
      //       return Container(
      //         child: Column(
      //           children: [
      //             Text(snapshot.toString()),
      //           ],
      //         ),
      //       );
      //     });
      showss.add(snapshot.value);

      print(snapshot.value);

    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("RealTime DB Test"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: () {
                getData();
              },
              color: Colors.indigoAccent,
            ),
            SizedBox(
              height: 25,
            ),
            Text(showss.toString()),
          ],
        ),
      ),
    );
  }
}







class RealFDBBB extends StatefulWidget {
  const RealFDBBB({Key? key}) : super(key: key);

  @override
  State<RealFDBBB> createState() => _RealFDBBBState();
}

class _RealFDBBBState extends State<RealFDBBB> {
  DatabaseReference firebaseRef =
      FirebaseDatabase.instance.ref("Registered Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: firebaseRef.once(),
        builder: (context, AsyncSnapshot<DatabaseEvent> event) {
          Map<dynamic, dynamic>? datas = event.data!.snapshot.value as Map?;
          List<Map<dynamic, dynamic>> showDatas = [];
          datas!.forEach((key, value) {
            showDatas.add(datas);
          });
          return  ListView.builder(
                    shrinkWrap: true,
                    itemCount: showDatas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("User Name: " + showDatas[index]["name"]),
                            Text("User email: " + showDatas[index]["email"]),
                            Text("User phone: " + showDatas[index]["phone"]),
                            Text("User address: " + showDatas[index]["address"]),
                          ],
                        ),
                      );
                    });
        },
      ),
    );
  }
}
