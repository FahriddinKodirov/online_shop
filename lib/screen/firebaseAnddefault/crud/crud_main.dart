import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/screen/firebaseAnddefault/crud/insert.dart';
import 'package:online_shop/screen/firebaseAnddefault/crud/update.dart';

class CrudHome extends StatefulWidget {
  const CrudHome({super.key});

  @override
  _CrudHomeState createState() => _CrudHomeState();
}

class _CrudHomeState extends State<CrudHome> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('contacts');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ccreate(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: db_Ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          Map Contact = snapshot.value as Map;
          Contact['key'] = snapshot.key;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateRecord(
                    Contact_Key: Contact['key'],
                  ),
                ),
              );
              // print(Contact['key']);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      db_Ref.child(Contact['key']).remove();
                    },
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      Contact['url'],
                    ),
                  ),
                  title: Text(
                    Contact['name'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    Contact['number'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}