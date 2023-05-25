import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: camel_case_types
class pdfview extends StatefulWidget {
  pdfview({required this.url,});

  String url;

  @override
  // ignore: no_logic_in_create_state
  State<pdfview> createState() => _pdfviewState(
        url: url,
      );
}

class _pdfviewState extends State<pdfview> {
  String url;
  _pdfviewState({
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      url,
    );
  }
}
      // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',