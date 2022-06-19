import 'package:flutter/material.dart';
import 'package:sellfish/helper/helper_functions.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            HelperClass().getAdminData();
          },
          child: const Text('getDAta'),
        ),
      ],
    );
  }
}
