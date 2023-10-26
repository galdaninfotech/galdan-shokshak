import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;


CollectionReference products = FirebaseFirestore.instance.collection('products');
// # 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 persnal token github
// # BYRHMkXcgC53TipyJPqzhRDevq0j31rG token gitpod

class ProductsRepository {
  getProducts() {
    return products.doc().get();
  }

  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('products').doc();

    documentReference.get().then((dataSnapshot) {
      print(dataSnapshot.data());
    });
  }
}