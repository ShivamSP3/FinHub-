// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Order {
  final String? tradeId;
  final  String stockName;
  final int qty;
  final int buyPrice;
  final int? sellPrice;
  final String userId;

  Order( { this.tradeId,required this.stockName,required this.qty,required this.buyPrice, this.sellPrice,required this.userId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': tradeId,
      'stockName': stockName,
      'qty': qty,
      'buyPrice': buyPrice,
      'sellPrice': sellPrice,
      'userId': userId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
   tradeId :  map['_id']?? '',
   stockName :  map['stockName'] ?? '',
    qty:  map['qty']?? '',
    buyPrice:  map['buyPrice'] ?? '',
   sellPrice :  map['sellPrice'] != null ? map['sellPrice'] as int : null,
   userId  :  map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
