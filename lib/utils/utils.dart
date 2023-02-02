import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text,))
  );
}
pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();

 XFile? _file = await _imagePicker.pickImage(source: source);

 if (_file !=null) {
   return await _file.readAsBytes();
 }
 print("No Image Selected");
}
void httpErrorHandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess
}) async{
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)['msg']);
    break;
    case 500:
    showSnackBar(context, jsonDecode(response.body)['error']);
    break;
    default:
    showSnackBar(context,response.body);
  }
}