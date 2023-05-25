import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  final files = ValueNotifier(<File>[]);

  @override
  void initState() {
    files.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    files.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("whatsapp camera")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          List<File>? res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WhatsappCamera(),
            ),
          );
          if (res != null) files.value = res;
        },
      ),
      body: ListView.builder(
        itemCount: files.value.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Image.file(files.value[index]),
          );
        },
      ),
    );
  }

}