import 'package:firstapp/models/stores.dart';
import 'package:flutter/material.dart';

class ComplaintTile extends StatelessWidget {
  final Stores? brew;
  const ComplaintTile({Key? key, this.brew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: SizedBox(
                child: Image.network(
                  brew!.images,
                  fit: BoxFit.cover,
                ),
              )

              // child: ListTile(
              //   minLeadingWidth: 100,
              //   minVerticalPadding: 15,
              //   leading: CircleAvatar(
              //     radius: 40.0,
              //     child: ClipRect(
              //       child: Image.network(
              //         brew!.images,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     backgroundColor: Colors.brown[50],
              //   ),
              //   title: Text(brew!.complaint),
              // ),
              ),
          Container(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Text('complaint:\n' + brew!.complaint,
                  style: const TextStyle(fontWeight: FontWeight.bold)))
        ]));
  }
}

