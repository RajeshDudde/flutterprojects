import 'package:firstapp/models/stores.dart';
import 'package:firstapp/screens/home/complainttile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintList extends StatefulWidget {
  const ComplaintList({Key? key}) : super(key: key);

  @override
  _ComplaintListState createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Stores>>(context);
    print(brews);
    return Scrollbar(
        child: ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return ComplaintTile(brew: brews[index]);
      },
    ));
  }
}
