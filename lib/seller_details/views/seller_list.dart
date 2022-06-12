import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellfish/constants/db_collection_constants.dart';
import 'package:sellfish/constants/db_field_constants.dart';
import 'package:sellfish/seller_details/bloc/permission_bloc.dart';

class SellerList extends StatelessWidget {
  SellerList({Key? key}) : super(key: key);

  final collection = FirebaseFirestore.instance.collection(userCollection);

  final PermissionBloc _permissionBloc = PermissionBloc();

  final _textStyle = GoogleFonts.poppins();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller List'),
      ),
      body: BlocProvider(
        create: (context) => _permissionBloc,
        child: BlocBuilder<PermissionBloc, PermissionState>(
          builder: (context, state) {
            return StreamBuilder(
              stream:
                  collection.where(userTypeField, isEqualTo: true).snapshots(),
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: const [
                        Text('No Users Found'),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                } else {
                  final data = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            child: Text('Image'),
                          ),
                          title: SizedBox(
                            height: 20,
                            child: Text(
                              data[index][emailField].toString(),
                              style: _textStyle,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index][userNameField].toString(),
                                style: _textStyle,
                              ),
                              Text(
                                data[index][phoneNoField].toString(),
                                style: _textStyle,
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                          trailing: (data[index][permissionField] == false)
                              ? permissionButton(
                                  text: 'Accept',
                                  data: data,
                                  index: index,
                                  status: false,
                                )
                              : permissionButton(
                                  text: 'Reject',
                                  data: data,
                                  index: index,
                                  status: true,
                                ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  FloatingActionButton permissionButton({
    String? text,
    bool? status,
    List<QueryDocumentSnapshot<Object?>>? data,
    int? index,
  }) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.white,
      label: Text(
        text!,
        style: (status == false)
            ? GoogleFonts.poppins(color: Colors.green)
            : GoogleFonts.poppins(color: Colors.red),
      ),
      icon: Icon(
        Icons.add,
        color: (status == false) ? Colors.green : Colors.red,
        size: 20,
      ),
      onPressed: () {
        _permissionBloc.add(
          SetPermissionEvent(
            userId: data![index!][userIdField].toString(),
            currentStatus: status!,
          ),
        );
      },
    );
  }
}
