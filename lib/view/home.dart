import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();

  final _list = List.generate(10, (index) => 'test $index');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reverseList = _list.reversed.toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('dream')
                        .orderBy('createdAt')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('エラーが発生しました。');
                      }
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final list = snapshot.requireData.docs
                          .map<String>((DocumentSnapshot document) {
                        final documentData =
                            document.data()! as Map<String, dynamic>;
                        return documentData['content']! as String;
                      }).toList();
                      final reverseList = list.reversed.toList();
                      return ListView.builder(
                        itemCount: reverseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(
                              reverseList[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextField(
            //         controller: _controller,
            //         autofocus: true,
            //       ),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         final document = <String, dynamic>{
            //           'content': _controller.text,
            //           'createdAt': Timestamp.fromDate(DateTime.now()),
            //         };
            //         FirebaseFirestore.instance
            //           .collection('dream')
            //           .doc()
            //           .set(document);
            //         setState(_controller.clear);
            //       },
            //       child: const Text('送信'),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
