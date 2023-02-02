import 'package:flutter/material.dart';

class IntradayTile extends StatelessWidget {
  final String stockName;
  final String exName;
  final String orderType;
  final int qty;
  final double pnl;
  final double ltp;



  const IntradayTile({super.key, 
  required this.stockName, 
   this.exName ='NSE', 
   this.orderType ='MIS',
   this.qty = 0,
  required this.pnl, 
  required this.ltp});

  @override
  Widget build(BuildContext context) {
    return
     Container(
      decoration: BoxDecoration(
       border: Border.symmetric(horizontal: BorderSide(color: Colors.black26))
      ),
      height: 90,width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Qty $qty',style: TextStyle(color: Colors.black45),),
                  Text(orderType,style: TextStyle(color: Colors.amber),)
                ],),SizedBox(height: 5,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(stockName,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  pnl >0?
                  Text(
                    pnl.toStringAsFixed(2)
                    ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                    : Text(
                    pnl.toStringAsFixed(2)
                    ,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                ],),SizedBox(height: 5,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(exName,style: TextStyle(color: Colors.black45),),
                  Text('LTP '+ ltp.toStringAsFixed(2),style: TextStyle(color: Colors.black45),)
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}