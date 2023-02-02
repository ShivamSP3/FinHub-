// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_tile.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
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
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "   Search and Add to Watchlist",
                          prefixIcon: Icon(Icons.search, size: 40),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.pink),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          )),
                    ),
                  ),
                  // Column(children: [SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  // ),
                  // Image.network(
                  //     'https://pluspng.com/img-png/stock-market-png-stock-market-icon-256.png'),
                  // Text(
                  //   "Add Stocks To Watchlist",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),],)
                  StockTile(stockName: 'TCS', ltp: 3460.40, avg: 3408.35),
                  StockTile(stockName: 'BAJFINANCE', ltp: 5717.65, avg: 5713.90),
                  StockTile(stockName: 'HDFC', ltp: 2614.00, avg: 2614.30),
                  StockTile(stockName: 'SBIN', ltp: 523.05, avg: 529.70),
                  StockTile(stockName: 'AXISBANK', ltp: 869.45, avg: 868.65),
                  StockTile(stockName: 'INFY', ltp: 1581.00, avg: 1584.90),
                  StockTile(stockName: 'ADANIENT', ltp: 1565.25, avg: 2135.35),
           

                ],
              )),
            ),
          )),
    );
  }
}
