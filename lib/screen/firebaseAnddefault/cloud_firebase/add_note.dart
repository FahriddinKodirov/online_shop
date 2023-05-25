import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/screen/firebaseAnddefault/cloud_firebase/cloud_firebase.dart';


class AddNotePage extends StatelessWidget {
  AddNotePage({super.key});

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const CloudFirebasePage()));
              });
            },
            child: const Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'content',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}