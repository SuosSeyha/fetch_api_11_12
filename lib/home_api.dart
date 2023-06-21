import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomeAPI extends StatefulWidget {
  const HomeAPI({super.key});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  @override
  void initState() {
    fecthAPI();
    super.initState();
  }
  Future fecthAPI()async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    if(response.statusCode==200){
      debugPrint(" Successful....");
    }
    return json.decode(response.body); // List<Map<String,dynamic>>
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Fetch Api'
        ),
      ),
      body: FutureBuilder(
        future: fecthAPI(),
        builder: (context, snapshot) {
          return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            var data = snapshot.data[index];
              return Card(
              child: ListTile(
                leading:CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Text(
                    data['id'].toString(),
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
                title: Text(
                  data['title'].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                subtitle: Text(
                  data['body'].toString(),
                  style: const TextStyle(
                      fontSize: 15
                    ),),
                trailing: Text(
                  data['userId'].toString(),
                  style: const TextStyle(
                      fontSize: 15
                    ),
                  ),
              ),
            );  
          },
        );
        },
      )
    );
  }
}