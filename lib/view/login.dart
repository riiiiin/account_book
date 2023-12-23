import 'package:firebase_sample/main.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = '';
  String email = '';
  String password = '';
  String name = '';

  void signUpUser() async {
    String res = await AuthMethods()
        .signUpUser(email: email, password: password, name: name);
    if (res != 'success') {
      setState(() {
        infoText = "登録に失敗しました：$res";
      });
    } else {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const MyWidget();
        }),
      );
    }
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
      email: email,
      password: password,
    );
    if (res != 'success') {
      setState(() {
        infoText = "ログインに失敗しました：$res";
      });
    } else {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const MyWidget();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //メールアドレス
              TextFormField(
                decoration: const InputDecoration(labelText: '名前'),
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              //メールアドレス
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              //パスワード
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('ユーザ登録'),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text('ユーザー登録'),
                      onPressed: () => signUpUser())),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                //ログイン
                child: OutlinedButton(
                    child: const Text('ログイン'), onPressed: () => loginUser()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
