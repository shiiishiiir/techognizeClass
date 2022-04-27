import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Sliver App Bar"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  addDetails("Shishir", "021324564321234"),
                  addDetails("Mahidul", "021324564321234"),
                  addDetails("Nahid", "021324564321234"),
                  addDetails("Jamiul", "021324564321234"),
                  addDetails("Ehsan", "021324564321234"),
                  addDetails("Abeda", "021324564321234"),
                  addDetails("Shishir", "021324564321234"),
                  addDetails("Shishir", "021324564321234"),
                  addDetails("Shishir", "021324564321234"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget addDetails(String name, String number) {
  return ListTile(
    title: Text(name),
    subtitle: Text(number),
  );
}
