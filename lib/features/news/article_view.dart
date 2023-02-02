// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
 final String blogUrl ; 
  ArticleView({super.key,required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             toolbarHeight:70,backgroundColor: Colors.white,
             leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: () {
              Navigator.pop(context);
             },),
              title : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Fin",style: TextStyle(color: Colors.black,fontSize: 30),textAlign: TextAlign.center,),
                  Text("News",style: TextStyle(color: Colors.blue,fontSize: 30),textAlign: TextAlign.center,)      
                  , Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0)),  
                ],
              ),
              elevation: 0.0,
             ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}