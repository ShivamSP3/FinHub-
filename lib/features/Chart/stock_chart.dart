import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StockChartScreen extends StatefulWidget {
  final String stockName;
  const StockChartScreen({super.key, required this.stockName});

  @override
  State<StockChartScreen> createState() => _StockChartScreenState();
}

class _StockChartScreenState extends State<StockChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon:Icon( Icons.arrow_back_ios,color: Colors.black,)),
          title: Row(
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
        body: SafeArea(
          child: Center(
            child: (
              WebView(
              initialUrl: 'https://in.tradingview.com/chart/?symbol=NSE%3A${widget.stockName}',
              userAgent: 'random',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {},
            )),
          ),
        ));

  }
}