import 'package:flutter/material.dart';

import '../Controller/api_method.dart';
import '../model/getclass.dart';

class apiscreen extends StatefulWidget {
  const apiscreen({super.key});

  @override
  State<apiscreen> createState() => _apiscreenState();
}

class _apiscreenState extends State<apiscreen> {

  late List<Product>? _ProductModel = [];

  void initState() {
  super.initState();
    _getData();
  }

  void _getData() async {
    // print("ok");
    _ProductModel = (await ApiService_second ().getproducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text('API SCREEN',style: TextStyle(fontSize: 22.5,color: Colors.white),
        )
        ),
      ),

      body:   _ProductModel == null || _ProductModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )

          : ListView.builder(itemCount: _ProductModel!.length,itemBuilder:(context, index) {
            return SingleChildScrollView(
              child: SafeArea(

                child: Card(
                  child: Column(
                    children: <Widget>[

                      ListTile(
                        leading: Text(_ProductModel![index].id.toString()),
                        title: Text(_ProductModel![index].body),
                        subtitle: Text(_ProductModel![index].name),
                        tileColor: Colors.white60,
                      ),

                    ],
                  ),
                ),




              ),
            );
    },
    ),
    );
  }
}
