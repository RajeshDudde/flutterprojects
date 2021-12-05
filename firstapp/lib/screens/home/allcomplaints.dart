//import 'dart:html';

import 'package:firstapp/models/stores.dart';
import 'package:firstapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'complaintlist.dart';

class AllComplaints extends StatelessWidget {
  const AllComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Stores>>.value(
        value: DatabaseService().person,
        initialData: [],
        child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: const Text('All Complaints'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
            ),
            body: const ComplaintList()));
  }
}
