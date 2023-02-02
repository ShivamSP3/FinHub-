
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/portfolio/Screens/holding.dart';
import 'package:flutter_node_auth/features/portfolio/Screens/position.dart';

class PortFolio extends StatefulWidget {
  const PortFolio({super.key});

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
           appBar: AppBar(
            bottom: TabBar(
              isScrollable: false,
              tabs: [
              Tab(child: Text('Holdings',style: TextStyle(color: Colors.black),),),
               Tab(child: Text('Positions',style: TextStyle(color: Colors.black),),)
            ]),
             toolbarHeight:70,backgroundColor: Colors.white,
              title : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[  
                  Text("Port",style: TextStyle(color: Colors.black,fontSize: 30),textAlign: TextAlign.center,),
                  Text("folio",style: TextStyle(color: Colors.blue,fontSize: 30),textAlign: TextAlign.center,)
                ],
              ),
              elevation: 0.0,
             ),
              body: TabBarView(children: [
              Holdings(),
             Positions()
          ])
        ),
      ),
    );
  }
}