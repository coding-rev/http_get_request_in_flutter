import 'dart:convert';

import 'package:flutter_http/post_model.dart';
import 'package:http/http.dart';

class HttpService{
  var postUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final String postDeleteUrl = "https://jsonplaceholder.typicode.com/posts";
  // Delete Post Request
  
  // Future<void> deletePost(int id) async{
  //   Response res = await delete("$postDeleteUrl/$id");

  //   if (res.statusCode ==200){
  //     print("Deleted!");
  //   }
  // }

  // Get Post Request
  Future<List<Post>> getPosts() async{
    Response res = await get(postUrl);

    if (res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    }
    else{
     throw "Can't get post"; 
    }
  }
}