import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatefulWidget {
  const NewsShimmer({super.key});

  @override
  State<NewsShimmer> createState() => _NewsShimmerState();
}

class _NewsShimmerState extends State<NewsShimmer> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0,),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: Row(
                  children: [
                     Container(
                      margin: EdgeInsets.all(10),
                              width: 140,
                              height:90,
                              color: Colors.white,
                            ),
                            Container(
                      margin: EdgeInsets.all(10),
                              width: 140,
                              height:90,
                              color: Colors.white,
                            ),Container(
                      margin: EdgeInsets.all(10),
                              width: 140,
                              height:90,
                              color: Colors.white,
                            ),
                  ],
                ),
              ),),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: ListView.builder(
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                            width: double.infinity,
                            height:200,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),SizedBox(height: 10,),
                           Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20,)
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                         
                        ],
                      ),
                    ),
                    itemCount: 2,
                  ),
                ),
              ),
             
            ],
          ),
        ),
    );
  }
}