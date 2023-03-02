// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/portfolio/Widget/holding_tile.dart';

class Holdings extends StatelessWidget {
  const Holdings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(elevation: 5,
          margin: EdgeInsets.all(20),
            child: Container(
              height: 100,width: double.infinity,
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            ),child: Center(
              child: Text('No holdings')
            //    Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 20),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //            Text('Invested',style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
            //            Text('50,850.00',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold))
            //         ],),
            //          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //            Text('Current',style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
            //            Text('54,850.00',style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold))
            //         ],)
            //       ],),
            //     ),
            //     SizedBox(height: 5,),
            //     Divider(height: 1,color: Colors.black45,),
            //     SizedBox(height: 5,),
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //       Text('P&L',style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
            //       Text('+4000.00 ',style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold))
            //       ],
            //     ),
            //   )
            // ],)
            ),
            ),
          ),
          Column(children: [
             Divider(height: 1,color: Colors.grey,thickness: 1,),

           SizedBox(height: 200,),
           Text("No Holdings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           SizedBox(height: 10,),
            Text("Buy Equities from your watchlist"
            ,style: TextStyle(fontSize: 15,color: Colors.grey),)
          ],),
          // HoldingTile(stockName: 'TCS', qty: 10, ltp: 3460, avg: 3000),
          // HoldingTile(stockName: 'ADANI POWER', qty: 100, ltp: 202.50, avg: 208.50),

        ],
      ),
    );
  }
}