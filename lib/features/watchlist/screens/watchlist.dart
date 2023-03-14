// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/watchlist/screens/watchlist_tab.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_shimmer.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_tile.dart';
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  StreamController<StocksQuotes> _streamController = StreamController.broadcast();
   final StockServices stockServices = StockServices();

 String? status;

  String isFirst = 'N';
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
    fetchStatus();
  
    AuthService().getUserData(context);
     StockServices().getStocksPrice(_streamController);
    Timer.periodic(Duration(seconds: 20), (timer) {
      StockServices().getStocksPrice(_streamController);
    }); 
  }
  Future<void> onRefresh() {
     
    return StockServices().getStocksPrice(_streamController);
  }
  fetchStatus()async{
    status  = await stockServices.marketStatus();
    setState(() {
    });
  }
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TAb Code
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFirst = 'N';
     StockServices().getStocksPrice(_streamController);
                      });
                    },
                    child: isFirst == 'N'
                        ? Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 199, 190, 190),
                                      offset: Offset.fromDirection(1),
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5)
                                ]),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'NIFTY',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 199, 190, 190),
                                      offset: Offset.fromDirection(1),
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5)
                                ]),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'NIFTY',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isFirst = 'B';
                          
                        });
                      },
                      child: isFirst == 'B'
                          ? Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 199, 190, 190),
                                        offset: Offset.fromDirection(1),
                                        spreadRadius: 0.5,
                                        blurRadius: 0.5)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'BANKNIFTY',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 199, 190, 190),
                                        offset: Offset.fromDirection(1),
                                        spreadRadius: 0.5,
                                        blurRadius: 0.5)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'BANKNIFTY',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )),
                ],
              ),
              Column(
                children: [
                  Text('Market Status',style: GoogleFonts.montserrat(
                    fontSize: 14,fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                           shape: BoxShape.circle,border: Border.all(color:status=='open'? Colors.green: Colors.red)
                        ),
                        height: 15,width: 15,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(1.2),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                                ,color:status=='open'? Colors.green: Colors.red
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text( status ?? ' Closed' ,style: GoogleFonts.montserrat(
                    fontSize: 14,fontWeight: FontWeight.w400,
                  ),),
                    ],
                  )
                ],
              ),
              SizedBox(width: 10,)
          
            ],
          ),
          isFirst=='N'? 
             Expanded(
            child: StreamBuilder<StocksQuotes>(
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
          : WatchListTab()
      
      
        ],
      ),
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
