// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebBrowser extends StatefulWidget {
  const WebBrowser({
    Key? key,
    this.width,
    this.height,
    this.initialUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? initialUrl;

  @override
  _WebBrowserState createState() => _WebBrowserState();
}

class _WebBrowserState extends State<WebBrowser> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(widget.initialUrl ?? ""),
          ),
          onLoadStop: (controller, url) {
            if (url.toString().contains('export=download')) {
              // Automatically launch the URL when export=download is detected
              launch(url.toString());
            }
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              _progress = progress / 100.0;
            });
          },
        ),
        if (_progress < 1.0)
          LinearProgressIndicator(
            value: _progress,
            minHeight: 5.0,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
      ],
    );
  }
}
