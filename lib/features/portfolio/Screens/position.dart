
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/portfolio/Widget/intraday_tile.dart';
import 'package:flutter_node_auth/features/watchlist/widget/stock_shimmer.dart';
import 'package:flutter_node_auth/models/order.dart';
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:get/get.dart';

class Positions extends StatefulWidget {
  const Positions({super.key});

  @override
  State<Positions> createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
    List<Order>? orders=[];
    final StockServices stockServices = StockServices();
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

    fetchTrades();
    Timer.periodic(Duration(seconds: 1), (timer) {
     stockServices.getStocksPrice(_streamController);
     });
  }
  void deleteTrade(String tradeId){
    print(tradeId);
    stockServices.deleteTrade(context: context, tradeId: tradeId);
    setState(() {
    });
  }
   Future<void> fetchTrades()async{
    orders = await stockServices.fetchTrades(context: context);
    setState(() {
    });
  }
  Future<void> onRefresh(){
  Get.snackbar( margin: EdgeInsets.all(10),'Updated', 'Your positions are updated!');         
   return fetchTrades();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orders == null ? StockShimmer() :
      RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          children: [
          Card(elevation: 5,
            margin: EdgeInsets.all(20),
              child: Container(
                height: 70,width: double.infinity,
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              ),child: Center(
                
                child: orders!.isEmpty ? Text('No Positions'):
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Total P&L',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
               // Text('+4,050.00',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold))
              ],)),
              ),
            ),
           orders!.isNotEmpty ? SizedBox(height: 1,) :  Column(children: [
             Divider(height: 1,color: Colors.grey,thickness: 1,),

           SizedBox(height: 200,),
           Text("No Positions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           SizedBox(height: 10,),
            Text("Buy Equities from your watchlist"
            ,style: TextStyle(fontSize: 15,color: Colors.grey),)
          ],),
            // Container(
            //   child: Expanded(
            //     flex: 2,
            //     child: ListView.builder(
            //       itemCount: orders!.length,
            //       itemBuilder: (context, index) {
            //       return IntradayTile(
            //         onTap:()=> deleteTrade(orders![index].tradeId!),
            //         stockName: orders![index].stockName, qty: orders![index].qty, avg: orders![index].buyPrice.toDouble(), ltp:1000);
            //     },),
            //   ),
            // )
        
            StreamBuilder<StocksQuotes>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return StockShimmer();
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Please Wait'));
                  } else {
                 
                    return
                    Container(
              child: Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    String stockN= '';
                    String stockLTP= '0';
                    for (var j = 0; j < snapshot.data!.data.length; j++) {
                       if (orders![index].stockName==snapshot.data!.data[j].symbol) {
                        stockN=snapshot.data!.data[j].symbol;
                         print(stockLTP);
                          stockLTP=snapshot.data!.data[j].ltP.replaceAll(",", '');
                       break;
                     }
                     }
                  return IntradayTile(
                    onTap:()=> deleteTrade(orders![index].tradeId!),
                    stockName: orders![index].stockName, qty: orders![index].qty, avg: orders![index].buyPrice.toDouble(), ltp:double.parse(stockLTP));
                },),
              ),
            );
                  }
              }
            },
          ),
          
      
      
          ],
        ),
      ),
    );
  }
}