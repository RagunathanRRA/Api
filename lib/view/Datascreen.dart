// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../Controller/api_method.dart';
import '../model/model_class.dart';



class datascreen extends StatefulWidget {
  const datascreen({super.key});

  @override
  State<datascreen> createState() => _datascreenState();
}

class _datascreenState extends State<datascreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API CONFIG', style: TextStyle(fontSize: 22.0,color: Colors.white),),
      ),
    );
  }
}



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: const Text('API CONFIG',style: TextStyle(fontSize:22.5, fontWeight:FontWeight.bold,color: Colors.white)
        ),
        ),
        ),


      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
                child: CircularProgressIndicator(),
                )

          : ListView.builder(itemCount: _userModel!.length,itemBuilder:(context, index) {
           return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].id.toString()),
                    Text(_userModel![index].username),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].email),
                    Text(_userModel![index].website),
                    Text(_userModel![index].company.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
