import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);
  @override
  
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('calendar'),
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child:StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('エラーが発生しました。');
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
                List<dynamic> spendings = userData['spendings'] ?? [];
                List<dynamic> income = userData['income'] ?? [];
                return Container(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('spendings'),
                    if (spendings.isEmpty)
                      Text('No spendings yet.')
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: spendings.map<Widget>((spending) {
                          return Text(
                            'Amount: ${spending['money']}, Category: ${spending['category']}, Description: ${spending['memo']}, Date: ${spending['date']}',
                          );
                        }).toList(),
                      ),
                      Text('income'),
                    if (income.isEmpty)
                      Text('No income yet.')
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: income.map<Widget>((inc) {
                          return Text(
                            'Amount: ${inc['money']}, Category: ${inc['category']}, Description: ${inc['memo']}, Date: ${inc['date']}',
                          );
                        }).toList(),
                      ),
                  ],
                )
              );
              },

            ),
          ),
        ),
      )
    );
  }
}