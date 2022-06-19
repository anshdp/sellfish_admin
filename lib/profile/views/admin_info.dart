import 'package:flutter/material.dart';
import 'package:sellfish/helper/helper_functions.dart';

class AdminInfo extends StatelessWidget {
  const AdminInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'User Information',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  Column(
                    children: <Widget>[
                      const ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text('Location'),
                        subtitle: Text('Calicut'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('Email Id'),
                        subtitle: Text('$emailId'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('Phone'),
                        subtitle: Text('$phone'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('About Me'),
                        subtitle: Text(
                          'This is a about me link and you can khow about me in this section.',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
