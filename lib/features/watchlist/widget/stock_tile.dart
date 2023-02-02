import 'package:flutter/material.dart';

class StockTile extends StatefulWidget {
  final String stockName;
  final double ltp;
  final double avg;

  const StockTile({super.key, required this.stockName,  required this.ltp, required this.avg, });

  @override
  State<StockTile> createState() => _StockTileState();
}

class _StockTileState extends State<StockTile> {
    double change =0;
    double pnl =0;

    updateChangePer(){
      if (widget.avg<widget.ltp) {
        change =(widget.ltp-widget.avg)/widget.avg*100;
        return change.toStringAsFixed(2);
      }else{
         change =(widget.avg-widget.ltp)/widget.avg*100;
        return change.toStringAsFixed(2);
      }
    }
    
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
       border: Border.symmetric(horizontal: BorderSide(color: Colors.black26))
      ),
      height: 75,width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(widget.stockName,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w200),),
                 widget.avg <widget.ltp?
                  Text(
                  widget.ltp.toString()
                    ,style: TextStyle(color: Colors.green,fontSize: 15),)
                   : Text(
                  widget.ltp.toString()
                    ,style: TextStyle(color: Colors.red,fontSize: 15),) 
                ],),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('NSE',style: TextStyle(color: Colors.black45),),
                 widget.avg> widget.ltp ?
                  Text( "-${(widget.avg-widget.ltp).toStringAsFixed(2)}" +"("+updateChangePer()+"%)",style: TextStyle(color: Colors.black45),)
                  :Text("+${(widget.ltp-widget.avg).toStringAsFixed(2)}" +"("+updateChangePer()+"%)",style: TextStyle(color: Colors.black45),)
                ],),SizedBox(height: 5,),
                  SizedBox(height: 5,),
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //   Text("Invested "+invested.toStringAsFixed(2),style: TextStyle(color: Color.fromARGB(115, 8, 8, 8)),),
                //   Text('LTP ${widget.ltp..toStringAsFixed(2)}',style: TextStyle(color: Colors.black45),)
                // ],)
              ],
            ),
          ),
        ],
      ),
    );
  }}