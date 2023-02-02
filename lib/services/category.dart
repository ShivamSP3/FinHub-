import 'package:flutter_node_auth/models/category.dart';

List<CatergoryModel> getCategories() {
  List<CatergoryModel> category = [];
  
      CatergoryModel catergoryModel =  CatergoryModel();
      catergoryModel.categoryName = "Market";
      catergoryModel.imageUrl =("https://media.istockphoto.com/photos/closeup-bond-market-trading-screen-with-rising-yields-coupons-rates-picture-id1367511149?b=1&k=20&m=1367511149&s=170667a&w=0&h=PYUjYM4mRLaP0uP-3spxHCmFZOdVCT8HSDSlzIQ-pw4=");
      category.add(catergoryModel);


      catergoryModel =  CatergoryModel();
       catergoryModel.categoryName = "Global News";
      catergoryModel.imageUrl =("https://images.unsplash.com/photo-1521295121783-8a321d551ad2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z2xvYmFsJTIwbmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60");
      category.add(catergoryModel);

      catergoryModel =  CatergoryModel();
       catergoryModel.categoryName = "Economy";
      catergoryModel.imageUrl =("https://images.unsplash.com/photo-1565514158740-064f34bd6cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGVjb25vbXl8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60");
      category.add(catergoryModel);

      catergoryModel =  CatergoryModel();
       catergoryModel.categoryName = "National";
      catergoryModel.imageUrl =("https://images.unsplash.com/photo-1532375810709-75b1da00537c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmF0aW9uYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60");
      category.add(catergoryModel);

      catergoryModel =  CatergoryModel();
       catergoryModel.categoryName = "Events";
      catergoryModel.imageUrl =("https://images.unsplash.com/photo-1517048676732-d65bc937f952?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZXZlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60");
      category.add(catergoryModel);


     return category;

}
