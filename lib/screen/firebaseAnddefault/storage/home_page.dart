import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/screen/firebaseAnddefault/cloud_firebase/add_note.dart';
import 'package:online_shop/screen/firebaseAnddefault/storage/report_page.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  // ignore: prefer_typing_uninitialized_variables
  var lis, liss, url;

  @override
  void initState() {
    lis = FirebaseStorage.instance.ref("images").listAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 11, 133),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AddNotePage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 11, 133),
        title: const Text('Students'),
      ),
      body: FutureBuilder<ListResult>(
        future: lis,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            liss = snapshot.data!.items;
          }
          return ListView.builder(
            itemCount: liss.length,
            itemBuilder: (context, index) {
              var image = liss[index];
              return GestureDetector(
                onTap: () {
                  downl(image);
                },
                child: ListTile(
                  title: Text(image.name),
                ),
              );
            },
          );
        },
      ),
    );
  }

  downl(Reference ref) async {
    url = await ref.getDownloadURL().whenComplete(() {
      setState(() {
        url;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ReportPage(
                    url: url,
                  )));
    });
    print("//////////////////////////////////////");
    print(url.toString());
    print("//////////////////////////////////////");
  }
}
