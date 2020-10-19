import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datas.dart';
void main() {
  runApp(MaterialApp(
    home: JsonData(),
  ));
}


class JsonData extends StatefulWidget {
  @override
  _JsonDataState createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {

  List<Data> list = List();
  var isLoading = false;
  _fetchData() async{
    setState(() {
      isLoading =true;
    });
    final response = await http.get("https://api.github.com/users?since=135>");
    if(response.statusCode ==200){
      list = (json.decode(response.body) as List)
          .map((data) => new Data.fromJson(data)).toList();
      setState(() {
        isLoading = false;
      });
    }else{
      throw Exception('Failed to load post');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('JsonData'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text("Fetch Data"),
          onPressed: _fetchData,
        ),
      ),
      body: isLoading ? Center(
        child: Text('Loading'),
      )
    
          :ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(list[index].avatar_url),
              ),
              title:  Text(list[index].url),
              subtitle: Text(list[index].repos_url),
            );
          }
      ),
    );
  }
}
