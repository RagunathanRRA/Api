import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post_method.dart';
class apipost extends StatefulWidget {
  const apipost({super.key});

  @override
  State<apipost> createState() => _apipostState();
}


class _apipostState extends State<apipost> {



  var name=TextEditingController();
  var job=TextEditingController();





  Future<void> sendPostRequest() async {
    final Uri apiUrl = Uri.parse( "https://reqres.in/api/user");
    var response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name.text,
          "job": job.text,
        }));

    if (response.statusCode == 201){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Post created successfully!"),
      ));

    } else {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Failed to create post!"),
      ));

    }
  }












// Future<void> sendPostRequest() async {
  //   final Uri apiendpoint = Uri.parse("https://reqres.in/api/user"); // Correct the URL format.
  //
  //   final Map<String, dynamic> requestBody = {
  //     "name": name.text,
  //     "job": job.text,
  //   };
  //
  //   final response = await http.post(
  //     apiendpoint,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(requestBody),
  //   );
  //
  //   if (response.statusCode == 201) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Post created successfully!"),
  //     ));
  //   }
  //
  //   else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Failed to create post!"),
  //     ));
  //   }
  //
  //
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Api Post Method",style: TextStyle(fontSize: 22.0 ,color: Colors.white),)),
        ),

      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name'
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: job,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Job"
                  ),
                ),
              ),


              SizedBox(
                width: 150.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                    onPressed:sendPostRequest,
                    child:Text('Submit',style: TextStyle(color: Colors.white)
                    ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
