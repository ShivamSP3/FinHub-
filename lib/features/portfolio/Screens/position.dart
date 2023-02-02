
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/portfolio/Widget/intraday_tile.dart';

class Positions extends StatelessWidget {
  const Positions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Card(elevation: 5,
          margin: EdgeInsets.all(20),
            child: Container(
              height: 70,width: double.infinity,
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            ),child: Center(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Total P&L',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
              Text('+4,050.00',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold))
            ],)),
            ),
          ),
          // Column(
          //   children: [
          //    Divider(height: 1,color: Colors.grey,thickness: 1,),
          //    SizedBox(height: 200,),
          //    Text("No Positions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          //    SizedBox(height: 10,),
          //    Text("Place an order from your watchlist"
          //   ,style: TextStyle(fontSize: 15,color: Colors.grey),)
          //   ],
          // )
          IntradayTile(ltp: 17810.50,pnl: 1000.00,stockName: 'NIFTY FUT',),
          IntradayTile(ltp: 40705.50,pnl: 3050.00,stockName: 'BANKNIFTY FUT',)


        ],
      ),
    );
  }
}