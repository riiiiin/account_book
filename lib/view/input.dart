import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/components/categories.dart';
import 'package:firebase_sample/components/datePicker.dart';
import 'package:firebase_sample/view/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController controllerMoney = TextEditingController();
  String controllerCategory = '食費';
  TextEditingController controllerMemo = TextEditingController();
  String controllerDate = DateTime.now().toString();
  bool isSpending = true;

  void selectedCategory(String category) {
    controllerCategory = category;
    print(controllerCategory);
  }

  void selectedDate(String date) {
    controllerDate = date;
    print(controllerDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isSpending = true;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (isSpending) {
                      return Colors.blue; //タップ中の色
                    }
                    return Colors.white; //通常時の色（透明色）
                  },
                )),
                child: const Text(
                  '支出',
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    isSpending = false;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (isSpending) {
                      return Colors.white; //タップ中の色
                    }
                    return Colors.blue; //通常時の色（透明色）
                  },
                )),
                child: const Text(
                  '収入',
                )),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controllerMoney,
                decoration: const InputDecoration(labelText: '金額'),
              ),
              Categories(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  selectedCategory: selectedCategory),
              TextField(
                controller: controllerMemo,
                decoration: const InputDecoration(labelText: 'メモ'),
              ),
              DatePickera(selectedDate: selectedDate),
              const SizedBox(height: 16),
              OutlinedButton(
                child: const Text('保存'),
                onPressed: () async {
                  final newDocuments = <String, dynamic>{
                    'money': controllerMoney.text,
                    'category': controllerCategory,
                    'memo': controllerMemo.text,
                    'date': controllerDate,
                  };
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update(isSpending
                          ? {
                              'spendings': FieldValue.arrayUnion([newDocuments])
                            }
                          : {
                              'income': FieldValue.arrayUnion([newDocuments])
                            });
                  setState(() {
                    controllerCategory = '食費';
                    controllerDate = DateTime.now().toString();
                    controllerMemo.clear();
                    controllerMoney.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
