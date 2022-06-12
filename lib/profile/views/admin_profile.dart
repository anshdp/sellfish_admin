import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final User? user = auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.greenAccent, Colors.white],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(Icons.people_alt_rounded),
                  radius: 60,
                ),
                const SizedBox(height: 10),
                Text(user!.email.toString()),
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  elevation: 5.0,
                  child: Text('sdfsdfsdufsdfsdfs  '),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Center(),
        )
      ],
    );
  }
}

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> inputData() async {
  final User? user = auth.currentUser;
  final uid = user!.uid;
  print('---------------------------------');
  print(uid);
  print(user.email);
  // here you write the codes to input the data into firestore
}
