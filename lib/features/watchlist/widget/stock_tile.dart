// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/Chart/stock_chart.dart';
import 'package:flutter_node_auth/features/watchlist/screens/buy_screen.dart';
import 'package:flutter_node_auth/features/watchlist/widget/button.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StockTile extends StatefulWidget {
  final String stockName;
  final String ltp;
  final String prev;

  const StockTile({
    super.key,
    required this.stockName,
    required this.ltp,
    required this.prev,
  });

  @override
  State<StockTile> createState() => _StockTileState();
}

class _StockTileState extends State<StockTile> {
  double change = 0;
  double pnl = 0;
  Widget build(BuildContext context) {
    int prevP = double.parse(widget.prev).toInt();
    int ltP = double.parse(widget.ltp).toInt();
    updateChangePer() {
      if (prevP < ltP) {
        change = (ltP - prevP) / prevP * 100;
        return change.toStringAsFixed(2);
      } else {
        change = (prevP - ltP) / prevP * 100;
        return change.toStringAsFixed(2);
      }
    }

    return InkWell(
      onTap: () => showBottomSheet(
        elevation: 10.0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.stockName,
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'NSE   ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      prevP < ltP
                          ? Text(
                              widget.ltp.toString() + "    ",
                              style: TextStyle(color: Colors.green),
                            )
                          : Text(
                              widget.ltp.toString() + "    ",
                              style: TextStyle(color: Colors.red),
                            ),
                      prevP > ltP
                          ? Text(
                              "-${(prevP - ltP).toStringAsFixed(2)}" +
                                  "(" +
                                  updateChangePer() +
                                  "%)",
                              style: TextStyle(color: Colors.black54),
                            )
                          : Text(
                              "+${(ltP - prevP).toStringAsFixed(2)}" +
                                  "(" +
                                  updateChangePer() +
                                  "%)",
                              style: TextStyle(color: Colors.black54),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 1, thickness: 1),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorButton(
                          color: Colors.blue,
                          title: 'BUY',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(  MaterialPageRoute(
                                  builder: (context) => BuySellScreen(
                                      stockName: widget.stockName,
                                      price: ltP.toDouble(),
                                      changePer:
                                          double.parse(updateChangePer()),
                                      change: (prevP - ltP).toDouble()),
                                ));
                            // Navigator.push(
                            //     context,
                            //   );
                          }),
                      ColorButton(
                        color: Colors.red,
                        title: 'SELL',
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 1, thickness: 1),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StockChartScreen(
                          stockName: widget.stockName,
                        ),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icon/chart.svg',
                            color: Colors.blue),
                        Text(
                          '    View Chart    ',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SvgPicture.asset('assets/icon/arrow_f.svg',
                            color: Colors.blue),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      //Stocks Watchlist
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black26))),
        height: 75,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.stockName,
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w200),
                      ),
                      prevP < ltP
                          ? Text(
                              widget.ltp.toString(),
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            )
                          : Text(
                              widget.ltp.toString(),
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NSE',
                        style: TextStyle(color: Colors.black45),
                      ),
                      prevP > ltP
                          ? Text(
                              "-${(prevP - ltP).toStringAsFixed(2)}" +
                                  "(" +
                                  updateChangePer() +
                                  "%)",
                              style: TextStyle(color: Colors.black45),
                            )
                          : Text(
                              "+${(ltP - prevP).toStringAsFixed(2)}" +
                                  "(" +
                                  updateChangePer() +
                                  "%)",
                              style: TextStyle(color: Colors.black45),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
      ),
    );
  }
}
