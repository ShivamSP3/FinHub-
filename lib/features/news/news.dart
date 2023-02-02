
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/news/article_view.dart';
import 'package:flutter_node_auth/models/category.dart';
import 'package:flutter_node_auth/models/news.dart';
import 'package:flutter_node_auth/services/category.dart';
import 'package:flutter_node_auth/services/news_service.dart';
import 'package:provider/provider.dart';



class NewsSection extends StatefulWidget {
  const NewsSection({super.key});
  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {

 List<CatergoryModel> categories = [];
 List<ArticleModel> articles = [];
 bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   categories = getCategories();
    getNews();
  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
   articles = newsClass.news;
   setState(() {
     _loading = false;
   });
  }
  Widget build(BuildContext context) {
  
    return 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            
             toolbarHeight:60,backgroundColor: Colors.white,
              title : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),  
                  Text("Fin",style: TextStyle(color: Colors.black,fontSize: 30),textAlign: TextAlign.center,),
                  Text("News",style: TextStyle(color: Colors.blue,fontSize: 30),textAlign: TextAlign.center,)      
                ],
              ),
              elevation: 0.0,
             ),
             // Body Part
              body:_loading ? Center(
                child: Container(     
                  child: CircularProgressIndicator(),
                ),
              ) : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:  Column(
                    children:<Widget> [
                      //// Categories
                      Container(
                         padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                      ),
                      //// Blogs
                      Container(
                        child: ListView.builder(itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                         itemBuilder: (context, index) {
                           return BlogTile(imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                             desc: articles[index].description
                             ,url: articles[index].url,
                             );
                         },
                        ),
                      )
                    ],
                  ),
                ),
              ),
       ) );
  }
}
class CategoryTile extends StatelessWidget {
 
   final String imageUrl, categoryName;
  const CategoryTile({super.key, required this.imageUrl,required this.categoryName});  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    //   onTap: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => 
    //  //   CategoryNews(category: categoryName.toLowerCase())
    //     ,));
    //   },
     child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
        children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
              imageUrl : imageUrl,width: 140,height: 90,fit: BoxFit.cover,)),
          
            Container(   
           
              width: 140,height: 90,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              color: Colors.black26,),
              child: Center(
                child: Text(
                    categoryName,style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {

  final String imageUrl , title , desc, url ;
  BlogTile({required this.imageUrl , required this.title , required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: 
      (context) => ArticleView(blogUrl: url)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
              SizedBox(height: 8,),
            Text(title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
       
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}