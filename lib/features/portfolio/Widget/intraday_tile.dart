import 'package:flutter/material.dart';

class IntradayTile extends StatelessWidget {
  final String stockName;
  final String exName;
  final String orderType;
  final int qty;
  final double avg;
  final double ltp;
  final VoidCallback onTap;



  const IntradayTile({super.key, 
  required this.stockName, 
   this.exName ='NSE', 
   this.orderType ='MIS',
   required this.qty ,
   required this.avg,
  required this.ltp, required this.onTap});

  @override
 
  Widget build(BuildContext context) {
    double pnl =0;
  updatePnl(){
      pnl = (ltp-avg)*qty;
      return pnl.toStringAsFixed(2);
    }
    return
     InkWell(
      onLongPress: onTap,
       child: Container(
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
                    (ltp > avg) ?
                    Text(
                     "+ "+updatePnl()
                      ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                      : Text(
                      " "+updatePnl()
                      ,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                  ],),SizedBox(height: 5,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(exName + "   AVG. $avg",style: TextStyle(color: Colors.black45),),
                    Text('LTP '+ ltp.toStringAsFixed(2),style: TextStyle(color: Colors.black45),)
                  ],)
                ],
              ),
            ),
          ],
        ),
         ),
     );
  }
}