import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Bits"),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    '''Education is all about creating an environment of academic freedom, where bright minds meet,
                discover and learn.
Balaji Institute of Technology & Science is the one of the best Engineering college in warangal district,
 popularly known as BITS, was established by Maheshwara Educational Society in 2001 at Laknepally Village near
  Narsampet beside Warangal-Narsampet Main Road in an area of 35 acres with an in take of 180. The place is well 
  connected by road and train and is only 20 minutes drive from Warangal. Presently the college offers B.Tech courses
   in CIVIL, EEE, ME, ECE, CSE, CSE(IoT), CSE (AIML), CE (SW) with an intake of 840 besides MBA with an intake of 60.
    College offers M.Tech Courses in CSE(30). College also offers Diploma (II Shift) Courses in DEE(60) and DME(60).
     BITS has been consistent to maintain excellence in the academic standards since its inception.
      Discipline is hallmark of BITS. Learning is an enjoyable experience here, with experienced faculty,
       inspiring libraries and large playgrounds and state-of-the-art labs. The management has constructed
        magnificent buildings on the campus surrounded by serene and natural surrounding with plenty of greenery.
         All the laboratories are established with sophisticated and modern equipment. The State-of-the-art facilities
          are provided in the institution to meet the Academic requirements of Staff & Students. Student's Welfare,
           Academic Growth, their Placements and overall Personality Development is the Motto. Round the Clock Security,
            ATM, Departmental Stores and Canteen are some of the facilities available in the Campus. ,'''),
              ),
            ])));
  }
}
