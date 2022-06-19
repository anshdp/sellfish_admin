import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sellfish/helper/helper_functions.dart';
import 'package:sellfish/profile/admin_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, .9),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 330,
                color: Colors.deepOrange,
              ),
              const Positioned(
                top: 10,
                right: 30,
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 60),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text('image'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Text(
                    '$name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  const Text(
                    'Calicut',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 77),
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 5,
                                ),
                                child: const Text(
                                  'Feedback',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: const Text(
                                  '100',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: const Text(
                                  'Sellers',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: const Text(
                                  '10',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                child: const Text(
                                  'Customers',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: const Text(
                                  '167',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const AdminInfo()
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:sellfish/helper/helper_functions.dart';

// class Profile extends StatelessWidget {
//   Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             HelperClass().getAdminData();
//           },
//           child: const Text('getDAta'),
//         ),
//       ],
//     );
//   }
// }
