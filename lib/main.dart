import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'BottomNavigation/BottomNavigation.dart';
import 'auth/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA6t1s2a_Wo2r1BmxGFxKGCu8auMTQXfFw",
      appId: "1:544943335395:android:3fdf1ebd21c60f252462d6",
      messagingSenderId: "544943335395",
      projectId: "spendwise-847d3",
      storageBucket: "spendwise-847d3.appspot.com",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const BottomNavigation();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
