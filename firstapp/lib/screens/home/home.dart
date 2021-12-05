//import 'dart:io';

import 'package:firstapp/models/stores.dart';
//import 'package:firstapp/models/user.dart';
//import 'package:firstapp/models/user.dart';
import 'package:firstapp/screens/home/about.dart';
import 'package:firstapp/screens/home/complaint.dart';
import 'package:firstapp/services/auth.dart';
import 'package:firstapp/services/database.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'allcomplaints.dart';

//import 'package:firstapp/models/user.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({Key? key}) : super(key: key);

  get uid => null;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Stores>>.value(
        initialData: const [],
        value: DatabaseService().person,
        child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: const Text('Home Page'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: ElevatedButton(
                    child: const Text('About Bits clg'),
                    onPressed: () {
                      //  About();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    //style: BoxWidthStyle.values.,
                    child: const Text('post complaint'),
                    onPressed: () {
                      // Complaint();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Complaint()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    //style: BoxWidthStyle.values.,
                    child: const Text('See All complaint\'s'),
                    onPressed: () {
                      // Complaint();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllComplaints()),
                      );
                    },
                  ),
                ),
              ],
            ))));
  }
}
