import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/image_view.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/pdf_view.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/second.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/video_play.dart';


class UploadPage extends StatefulWidget {
  String did;
  String type;
  String url;
  UploadPage({
    required this.did,
    required this.type,
    required this.url,
  });
  @override
  State<UploadPage> createState() => _UploadPageState(
        did: did,
        type: type,
        url: url,
      );
}

class _UploadPageState extends State<UploadPage> {
  String did;
  String type;
  String url;
  _UploadPageState({
    required this.did,
    required this.type,
    required this.url,
  });

  final _auth = FirebaseAuth.instance;
  TextEditingController title = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  File? file;
  String url1 = "";
  var name;
  var ft;
  var ic;
  var vis = false;
  @override
  void initState() {
    if (type == 'PDF') {
      ft = ['pdf'];
      ic = const Icon(
        Icons.picture_as_pdf,
        color: Color.fromARGB(255, 181, 0, 45),
        size: 40,
      );
    }
    if (type == 'Image') {
      ft = ['jpg', 'png'];
      ic = const Icon(
        Icons.image,
        color: Color.fromARGB(255, 0, 91, 181),
        size: 40,
      );
    }
    if (type == 'video') {
      ft = ['mp4'];
      ic = const Icon(
        Icons.play_circle,
        color: Color.fromARGB(255, 181, 0, 45),
        size: 50,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('folders')
        .doc(did)
        .collection(type)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // ref
              //   ..doc(user!.uid)
              //       .collection('folders')
              //       .doc(did)

              var catalogues = ref
                  .doc(user!.uid)
                  .collection('folders')
                  .doc(did)
                  .collection(type)
                  .get();
              catalogues.then((value) => value.docs.remove(value));

              ref
                  .doc(user!.uid)
                  .collection('folders')
                  .doc(did)
                  .delete()
                  .whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (SecondPage(
                      url: url,
                    )),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Color.fromARGB(255, 181, 0, 45),
            ),
          ),
        ],
        backgroundColor: Colors.indigo[900],
        leading: CircleAvatar(
          radius: 50, // Image radius
          backgroundImage: NetworkImage(
            url,
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Web',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Text(
              'Fun',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      if (type == 'Image') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (imageview(
                              url: data['url'],
                            )),
                          ),
                        );
                      }
                      if (type == 'PDF') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (pdfview(
                              url: data['url'],
                            )),
                          ),
                        );
                      }
                      if (type == 'video') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (videoplay(
                              url: data['url'],
                            )),
                          ),
                        );
                      }
                    },
                    child: ListTile(
                      leading: ic,
                      title: Text(data['name']),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 0, 64),
                        ),
                        onPressed: () {
                          ref
                              .doc(user!.uid)
                              .collection('folders')
                              .doc(did)
                              .collection(type)
                              .doc(document.id)
                              .delete();
                        },
                      ),

                      // subtitle: Text(data['type']),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Center(
            child: Visibility(
              visible: vis,
              child: CircularProgressIndicator(
                color: Colors.indigo[800],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getfile();
          _showMyDialog();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a folder'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: 'folder name',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('create'),
              onPressed: () {
                if (title.text != '') {
                  User? user = _auth.currentUser;
                  ref
                      .doc(user!.uid)
                      .collection('folders')
                      .doc(did)
                      .collection(type)
                      .add({
                    'name': title.text,
                  });
                  title.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ft,
    );

    if (result != null) {
      File c = File(result.files.single.path.toString());
      setState(() {
        file = c;
        name = result.names[0];
        vis = true;
      });

      uploadFile();
    }
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance.ref().child(type).child(name);
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url1 = await snapshot.ref.getDownloadURL();

      // print(url);
      if (url1 != null && file != null) {
        User? user = _auth.currentUser;
        ref.doc(user!.uid).collection('folders').doc(did).collection(type).add({
          'url': url1,
          'name': name,
        });
        setState(() {
          vis = false;
        });
        Fluttertoast.showToast(
          msg: "Done Uploaded",
          textColor: Colors.red,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          textColor: Colors.red,
        );
        setState(() {
          vis = false;
        });
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.red,
      );
      setState(() {
        vis = false;
      });
    }
  }
}