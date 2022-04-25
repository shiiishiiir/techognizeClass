import 'dart:convert';

import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techognize/widgetss/Pages/ListViewDataPassing.dart';

class ContactListJson extends StatefulWidget {
  const ContactListJson({Key? key}) : super(key: key);

  @override
  State<ContactListJson> createState() => _ContactListJsonState();
}

class _ContactListJsonState extends State<ContactListJson> {
  late List readyData = [];

  late List unfilterData;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString("assets/JsonData.json");
    setState(() {
      readyData = jsonDecode(jsonText);
    });

    return "Succesfully Got Data";
  }

  searchBar(str) {
    var stringExist = str.length > 0 ? true : false;
    if (stringExist) {
      var filterData = [];

      for (int i = 0; i < unfilterData.length; i++) {
        String namee = unfilterData[i]["name"].toUpperCase();

        if (namee.contains(str.toUpperCase())) {
          filterData.add(unfilterData[i]);
        }
        setState(() {
          this.readyData = filterData;
        });
      }
    } else {
      setState(() {
        this.readyData = unfilterData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadJsonData();
    this.readyData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Osthir Contact List"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Contact Here",
                  icon: Icon(Icons.search),
                ),
                onChanged: (String str) {
                  setState(() {
                    this.searchBar(str);
                  });
                },
              ),
              Expandable(
                firstChild: Text("Hi"),
                secondChild: Text(" I am Shishir, the Dew...."),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: readyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(readyData[index]["name"]),
                            subtitle: Text(readyData[index]["phone"]),
                            leading: CircleAvatar(
                              child: Text(readyData[index]["name"][0]),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListTilesDataPassing(
                                            useLists: readyData[index],
                                          )));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
