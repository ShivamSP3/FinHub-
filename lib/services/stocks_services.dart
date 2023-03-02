// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/models/market.dart';
import 'package:flutter_node_auth/models/order.dart';
import 'package:flutter_node_auth/models/user.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/utils/constants.dart';
import 'package:flutter_node_auth/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:provider/provider.dart';

class StockServices{
  Future<String> marketStatus()async{
    var url = Uri.parse('http://192.168.85.188:3000/get_market_status');
    final response = await http.get(url);
    final dataBody = jsonDecode(response.body);

     return dataBody['status'];
   
  }

  Future<void> getStocksPrice(StreamController streamController)async{
    var url = Uri.parse('http://192.168.85.188:3000/nse/get_index_stocks?symbol=bankNifty');
    final response = await http.get(url);
    final dataBody = jsonDecode(response.body);
    StocksQuotes stocksQuotes = StocksQuotes.fromJson(dataBody);
    streamController.sink.add(stocksQuotes);
   
  }
    void placeOrder({
    required BuildContext context,
    required String stockName,
    required int qty,
    required double buyPrice,
  }) async{
    try {
      var userProvider = Provider.of<UserProvider>(context,listen: false);
      final Order order = Order(
        stockName: stockName, 
        qty: qty, 
        buyPrice: buyPrice.toInt(), 
        userId: userProvider.user.id);
      http.Response res = await http.post(Uri.parse('${Constants.uri}/stock/order-buy'),
      body: order.toJson(),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token
      },
      );
      httpErrorHandling(response: res,
         context: context, onSuccess: ()async {
       Get.snackbar( margin: EdgeInsets.all(10),'Order Placed', 'Check positions for PnL');         

           User user =   userProvider.user.copyWith(
            trades:jsonDecode(res.body)['trades'],
           );
            userProvider.setUserFromModel(user);
              
       },);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
   
  void deleteTrade(
    {
      required BuildContext context,
      required String tradeId
    }
   )async{
 final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse('${Constants.uri}/trade-delete/$tradeId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
  
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'You have deleted your trade, Refresh to see changes!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
   }

  Future<List<Order>> fetchTrades({
     required BuildContext context,
  })async{
     final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
     List<Order> orderList = [];
    try {
     http.Response res = await http.get(Uri.parse('${Constants.uri}/stock/order/me'),
     headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token
      });
      httpErrorHandling(
       response: res, 
       context: context,
       onSuccess: (){
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
           orderList.add(
            Order.fromJson(jsonEncode(jsonDecode(res.body)[i]))
          );
        }
       });

  } catch (e) {
    showSnackBar(context, e.toString());
  }
  return orderList;
  }


}