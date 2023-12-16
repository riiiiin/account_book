import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String uid;
  final Function selectedCategory;

  const Categories(
      {Key? key, required this.uid, required this.selectedCategory})
      : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String isSelectedValue = '食費';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('エラーが発生しました。');
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final lists = snapshot.requireData
              .data()?['categories']
              .cast<String>()
              .toList();
          return DropdownButton(
            items: lists.map<DropdownMenuItem<String>>((String list) {
              return DropdownMenuItem(
                value: list,
                child: Text(list),
              );
            }).toList(),
            value: isSelectedValue,
            onChanged: (String? value) {
              setState(() {
                isSelectedValue = value!;
              });
              widget.selectedCategory(value);
            },
          );
        },
      ),
    );
  }
}
