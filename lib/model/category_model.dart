import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。
  List<String> categories = [];

  Future<void> fetchCategories(String uid) async {
    // Firestoreからコレクション'books'(QuerySnapshot)を取得してdocsに代入。
    final docs =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    // getter docs: docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    // map(): Listの各要素をBookに変換
    // toList(): Map()から返ってきたIterable→Listに変換する。
    final categorie = docs.data();
    print(categorie);
    notifyListeners();
  }
}
