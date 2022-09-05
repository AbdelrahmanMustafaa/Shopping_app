import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView1 extends StatelessWidget {
String? link ;

WebView1(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(initialUrl:link),
    );
  }
}
