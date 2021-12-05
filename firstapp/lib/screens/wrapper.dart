import 'package:firstapp/models/user.dart';
import 'package:firstapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    //return const Authenticate();
    // return either the Home or Authenticate widget
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return const Authenticate();
    } else {
      //Home()
      return Home();
    }
  }
}
