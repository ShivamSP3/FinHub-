// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:flutter_node_auth/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    Uint8List? _file;
 
    UserProvider user = Provider.of<UserProvider>(context);

    _selectImage(BuildContext context) async {
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Add Profile Photo'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Cancel '),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "User",
                style: TextStyle(color: Colors.black, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                "Profile",
                style: TextStyle(color: Colors.blue, fontSize: 30),
                textAlign: TextAlign.center,
              )
            ],
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
            child: GestureDetector(
                child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
                child: Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black26)),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      width: 380,
                      height: 120,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 55,
                                    backgroundImage: NetworkImage(
                                        'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                                    backgroundColor: Colors.black,
                                  ),
                                  // Positioned(
                                  //   bottom: -10,
                                  //   left: 70,
                                  //   child: IconButton(
                                  //     onPressed: () =>
                                  //         _selectImage(context),
                                  //     icon: const Icon(
                                  //       Icons.add_a_photo,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.user.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                        RichText(
                                    text: TextSpan(
                                        text: user.user.email,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))),
                              
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            // Generated code for this isDarkMode Widget...
            Field('Funds', Icons.currency_rupee, () {}),
            Field('Profile', Icons.person, () {}),
            Field('Settings', Icons.settings, () {}),
            Field('Contact Us', Icons.call, () {}),
            Field('Logout', Icons.logout, () {
              AuthService().signOut(context);
            })
          ]),
        ))));
  }
}

Widget Field(String text, IconData icon, VoidCallback onTap) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.black26)),
    elevation: 3,
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    child: Container(
        child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xE9FFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: IconButton(
                            icon: Icon(icon, color: Colors.black38),
                            onPressed: onTap),
                      ),
                    ],
                  ),
                )))),
  );
}
