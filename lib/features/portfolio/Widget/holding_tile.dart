import 'package:flutter/material.dart';

class HoldingTile extends StatefulWidget {
  final String stockName;
  final int qty;
  final double ltp;
  final double avg;

  const HoldingTile({super.key, required this.stockName, required this.qty, required this.ltp, required this.avg, });

  @override
  State<HoldingTile> createState() => _HoldingTileState();
}

class _HoldingTileState extends State<HoldingTile> {
    double change =0;
    double pnl =0;
 updatePnl(){
      pnl = (widget.ltp-widget.avg)*widget.qty;
      return pnl.toStringAsFixed(2);
    }
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
      double invested = widget.avg*widget.qty;
    return  Container(
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
                  Text('Qty. ${widget.qty} | Avg. ${widget.avg}',style: TextStyle(color: Colors.black45),),
                 widget.avg> widget.ltp ?
                  Text(updateChangePer()+"%",style: TextStyle(color: Colors.red),)
                  :Text(updateChangePer()+"%",style: TextStyle(color: Colors.green),)
                ],),SizedBox(height: 5,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(widget.stockName,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),),
                  widget.avg < widget.ltp?
                  Text(
                  '+'+ updatePnl().toString()
                    ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                    : Text(
                   "-"+ updatePnl().toString()
                    ,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                ],),SizedBox(height: 5,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Invested "+invested.toStringAsFixed(2),style: TextStyle(color: Color.fromARGB(115, 8, 8, 8)),),
                  Text('LTP ${widget.ltp..toStringAsFixed(2)}',style: TextStyle(color: Colors.black45),)
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  
  }
}