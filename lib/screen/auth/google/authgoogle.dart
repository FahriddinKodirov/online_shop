import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shop/data/repositories/auth/auth_google_repo.dart';
import 'package:online_shop/screen/main/home/home_page.dart';
import 'package:online_shop/screen/main/tab_box/tab_box.dart';
import 'package:provider/provider.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({Key? key}) : super(key: key);

  @override
  GoogleLoginPageState createState() => GoogleLoginPageState();
}

class GoogleLoginPageState extends State<GoogleLoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthGoogleViewModel authProvider = Provider.of<AuthGoogleViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(color: Color(0xff203152)),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  authProvider.signInWithGoogle().then((isSuccess) {
                    if (isSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabBarPage(),
                        ),
                      );
                    }
                  }).catchError((error, stackTrace) {
                    Fluttertoast.showToast(msg: error.toString());
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return const Color(0xffdd4b39).withOpacity(0.8);
                      return const Color(0xffdd4b39);
                    },
                  ),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
                ),
                child: const Text(
                  'Sign in with Google',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
           
          ],
        ));
  }
}
