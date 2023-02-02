// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Charting extends StatefulWidget {
  const Charting({super.key});

  @override
  State<Charting> createState() => _ChartingState();
}

class _ChartingState extends State<Charting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Fin",
                style: TextStyle(color: Colors.black, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                "Hub",
                style: TextStyle(color: Colors.blue, fontSize: 30),
                textAlign: TextAlign.center,
              )
            ],
          ),
          elevation: 0.0,
        ),
        body: Center(
          child: (
            WebView(
            initialUrl: 'https://in.tradingview.com/chart/RHahYkGW/',
            userAgent: 'random',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {},
          )),
        ));
  }
}
