// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_shimmer.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_tile.dart';
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:shimmer/shimmer.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  StreamController<StocksQuotes> _streamController = StreamController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getUserData(context);
    Timer.periodic(Duration(seconds: 1), (timer) {
      StockServices().getStocksPrice(_streamController);
    });
  }


  Future<void> onRefresh(){
   return  StockServices().getStocksPrice(_streamController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Watch",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "List",
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              elevation: 0.0,
              bottom: TabBar(tabs: [
                Tab(
                  child: Text(
                    "WatchList 1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "WatchList 2",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "WatchList 3",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ),
            body: StreamBuilder<StocksQuotes>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return StockShimmer();
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text('Please Wait'));
                    } else {
                      return RefreshIndicator(
                        onRefresh: onRefresh,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.latestData[0].indexName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          snapshot.data!.latestData[0].ltp +
                                              "   ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w100)),
                                      (snapshot.data!.latestData[0].ch
                                              .startsWith("-"))
                                          ? Text(
                                              snapshot.data!.latestData[0].ch +
                                                  "   " +
                                                  snapshot
                                                      .data!.latestData[0].per +
                                                  "%",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w100))
                                          : Text(
                                              snapshot.data!.latestData[0].ch +
                                                  "   " +
                                                  snapshot
                                                      .data!.latestData[0].per +
                                                  "%",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w100)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: GetStockDetailWidget(snapshot.data!)),
                          ],
                        ),
                      );
                    }
                }
              },
            ),
          )),
    );
  }

  Widget GetStockDetailWidget(StocksQuotes stocksQuotes) {
    return Center(
        child: ListView.builder(
      itemCount: stocksQuotes.data.length,
      itemBuilder: (context, index) {
        var stock = stocksQuotes.data[index];
        return StockTile(
            stockName: stock.symbol,
            ltp: stock.ltP.replaceAll(",", ''),
            prev: stock.previousClose.replaceAll(",", ''));
      },
    ));
  }
}
