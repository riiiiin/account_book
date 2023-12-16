import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/view/login.dart';
import 'package:flutter/material.dart';

import 'components/footer.dart';
import 'firebase_options.dart';
import 'route/view-ctrl-bloc.dart';
import 'route/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // スプラッシュ画面などに書き換えても良い
            return SizedBox();
          }
          if (snapshot.hasData) {
            // User が null でなない、つまりサインイン済みのホーム画面へ
            return MyWidget();
          }
          // User が null である、つまり未サインインのサインイン画面へ
          return LoginPage();
        },
      )
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ViewCtrlBloc? viewCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Views(viewCtrl: viewCtrl?.viewStream),
          bottomNavigationBar: Footer(viewCtrl: viewCtrl?.viewSink),
        ));
  }


  @override
  void initState() {
    super.initState();
    viewCtrl = ViewCtrlBloc();
  }

  @override
  void dispose() {
    viewCtrl?.dispose();
    super.dispose();
  }
}
