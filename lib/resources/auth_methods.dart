import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getUserDetails() async {
    //TODO userの詳細を取得する関数を記載
  }

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(cred.user?.uid).set({
        'userInfo': {
          "name": name,
          "email": email,
        },
        'shared': []
      });

      await _firestore.collection('categories').doc(cred.user?.uid).set({
        'spendings': [
          '食費',
          '外食費',
          '交通費',
          '衣服',
          '交際費',
          '趣味',
          'その他',
        ],
        'income': [
          '給料',
          'その他',
        ]
      });

      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formated';
      } else if (err.code == 'weak-password') {
        res = 'Password shoud be at least 6 characters';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Pleas enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {}
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
