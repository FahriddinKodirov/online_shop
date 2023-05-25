import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shop/data/repositories/auth/auth_facebook_repo.dart';
import 'package:online_shop/data/repositories/auth/auth_github_repo.dart';
import 'package:online_shop/data/repositories/auth/auth_google_repo.dart';
import 'package:online_shop/data/repositories/auth/auth_number_repo.dart';
import 'package:online_shop/data/repositories/auth/auth_repo.dart';
import 'package:online_shop/screen/auth/auth_page.dart';
import 'package:online_shop/screen/auth/github/auth_github_page.dart';
import 'package:online_shop/screen/auth/facebook/auth_facebook_page.dart';
import 'package:online_shop/screen/auth/google/authgoogle.dart';
import 'package:online_shop/screen/firebaseAnddefault/chat/login.dart';
import 'package:online_shop/screen/firebaseAnddefault/chat/register.dart';
import 'package:online_shop/screen/firebaseAnddefault/crud/crud_main.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_drive/drive_main.dart';
import 'package:online_shop/screen/firebaseAnddefault/google_map/google_map.dart';
import 'package:online_shop/screen/firebaseAnddefault/real_time/home.dart';
import 'package:online_shop/screen/firebaseAnddefault/storage/home_page.dart';
import 'package:online_shop/screen/main/tab_box/tab_box.dart';
import 'package:online_shop/view_model/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'screen/firebaseAnddefault/cloud_firebase/cloud_firebase.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();


  runApp(MultiProvider(providers: [
    Provider(
        create: (context) => AuthViewModel(
            authRepository: AuthRepository(auth: FirebaseAuth.instance))),
    ChangeNotifierProvider(
        create: (context) => AuthNumberViewModel(
            auth: FirebaseAuth.instance)),
    ChangeNotifierProvider(
        create: (context) => AuthGoogleViewModel(
            googleSignIn: GoogleSignIn(),
            )),
    ChangeNotifierProvider(
        create: (context) => AuthFacebookViewModel()),
    ChangeNotifierProvider(
        create: (context) => AuthGithubViewModel()),
    
  ], 
  child: const MyApp()));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CrudHome(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const StoragePage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
