import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/second.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  GoogleSignInAuthentication? googleAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/p1.png"),
          const SizedBox(
            height: 90,
          ),

          const Text(
            'Personal Drive App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: MaterialButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/2991/2991148.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sign In with Google",
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                var f = await signInWithGoogle();
                User? user = _auth.currentUser;
                if (f != null) {
                  var de = FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .get();

                  if (de != null) {
                    ref.doc(user.uid).set({
                      'name': name,
                      'url': url,
                      'email': email,
                    });
                  }

                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (SecondPage(
                        url: url,
                      )),
                    ),
                  );
                }
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 50),
          // ),

          const SizedBox(
            height: 90,
          ),
          const Text(
            'Made By',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser);
    url = googleUser!.photoUrl.toString();
    name = googleUser.displayName.toString();
    email = googleUser.email;

    // ignore: unnecessary_nullable_for_final_variable_declarations
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}