import 'dart:async';
import 'dart:io';
import 'package:fap/webview/web_view_stack.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../webview/navigation_controls.dart';

class LoginController extends StatefulWidget {
  LoginController({Key? key}) : super(key: key);
  String? _campusId;
  @override
  _LoginControllerState createState() => _LoginControllerState();

  void setCampusId(String? campusId) {
    _campusId = campusId;
  }
}

class _LoginControllerState extends State<LoginController> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Fap'),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
