import 'package:flutter/material.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

class BuySellScreen extends StatelessWidget {
  final String stockName;
  final double price;
  final double changePer;
  final double change;

  const BuySellScreen(
      {super.key,
      required this.stockName,
      required this.price,
      required this.changePer,
      required this.change});

  @override
  Widget build(BuildContext context) {
    final TextEditingController qtyController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
  priceController.text = price.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,elevation: 0,
        title: Text(stockName,style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(color: Colors.black,
          Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: 
                Center(
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity'),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 50,
                                width: 130,
                                child: TextField(
                                  
                                  controller:  qtyController  ,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '1',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price'),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 50,
                                width: 130,
                                child: TextField(
                                  controller: priceController,
                                  readOnly: true,
                                  decoration: InputDecoration( 
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                            ],
                              
                      ),
                    ),
                  ),
                ),
           
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SwipingButton(
            height: 60,
            text: 'Swipe To Buy',backgroundColor: Colors.blue, 
            onSwipeCallback: (){
              StockServices().placeOrder(context: context, stockName: stockName, qty: int.parse(qtyController.text==''? '1':qtyController.text), buyPrice: price);
            Navigator.pop(context);
            }
            )
        ),
      ),
    );
  }
}
