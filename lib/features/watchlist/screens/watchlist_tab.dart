import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_shimmer.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_tile.dart';
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:flutter_node_auth/utils/constants.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
   StreamController<StocksQuotes> _streamBNController = StreamController.broadcast();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     _streamBNController.close();
  }
   StocksQuotes quotes = StocksQuotes.fromJson(bnData);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      StockServices().getStocksPriceBN(_streamBNController);
       Timer.periodic(Duration(seconds: 20), (timer) {
      StockServices().getStocksPriceBN(_streamBNController);
    });
  }
  Future<void> onRefreshBN() {
    return StockServices().getStocksPriceBN(_streamBNController);
  }
  Widget build(BuildContext context) {
    return  Expanded(
            child: StreamBuilder<StocksQuotes>(
              stream: _streamBNController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    // return StockShimmer();
                 return   Column(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 15),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(snapshot.data!.latestData[0].indexName,
                            //           style: TextStyle(
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.w600)),
                            //       Row(
                            //         mainAxisAlignment: MainAxisAlignment.end,
                            //         children: [
                            //           Text(
                            //               snapshot.data!.latestData[0].ltp +
                            //                   "   ",
                            //               style: TextStyle(
                            //                   fontSize: 20,
                            //                   fontWeight: FontWeight.w100)),
                            //           (snapshot.data!.latestData[0].ch
                            //                   .startsWith("-"))
                            //               ? Text(
                            //                   snapshot.data!.latestData[0].ch +
                            //                       "   " +
                            //                      quotes.latestData[0].per +
                            //                       "%",
                            //                   style: TextStyle(
                            //                       color: Colors.red,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w100))
                            //               : Text(
                            //                   quotes.latestData[0].ch +
                            //                       "   " +
                            //                       snapshot
                            //                           .data!.latestData[0].per +
                            //                       "%",
                            //                   style: TextStyle(
                            //                       color: Colors.green,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w100)),
                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // ),
                            SizedBox(height: 20,),
                            Expanded(
                                child: GetStockDetailWidget(quotes)),
                          ],
                      
                      );
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text('Please Wait'));
                    } else {
                      return RefreshIndicator(
                        onRefresh: onRefreshBN,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Expanded(
                                child: GetStockDetailWidget(snapshot.data!)),
                          ],
                        ),
                      );
                    }
                }
              },
            ),
          )
      ;
     
  }
     Widget GetStockDetailWidget(StocksQuotes stocksQuotes) {
    return Center(
        child: ListView.builder(
      itemCount: stocksQuotes.data.length,
      itemBuilder: (context, index) {
        var stock = stocksQuotes.data[index];
        return StockTile(
            isNifty: false,
            stockName: stock.symbol,
            ltp: stock.ltP.replaceAll(",", ''),
            prev: stock.previousClose.replaceAll(",", ''));
      },
    ));
  }
}