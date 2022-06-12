import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sellfish/home/home.dart';

class AdminDrawer extends StatelessWidget {
  AdminDrawer({Key? key, required this.profileBloc}) : super(key: key);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 241, 238, 225),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.account_balance),
                  ),
                  trailing: Text(
                    'Admin123',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute<MaterialPageRoute>(
                //     builder: (context) => Settings()));
              },
            ),
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
            ),
            const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Products'),
            ),
            const ListTile(
              leading: Icon(Icons.delivery_dining),
              title: Text('Delivery'),
            ),
            const ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: Text('Customer'),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy policy'),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Terms & Conditions'),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
              onTap: () {
                profileBloc.add(LogoutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
