


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final data;
  var response1;

  @override
  void initState() {
    super.initState();
    response1 = fetchUsers();
    // myApiWidget(response: response1);
    // fetchUsers();
    // myApiWidget(response : response);
  }

  myApiWidget({required response}) {
  return FutureBuilder(
    future: response,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data[index]['name']['title'] +
                        " " +
                        snapshot.data[index]['name']['first'] +
                        " " +
                        snapshot.data[index]['name']['last']),
                    trailing:
                        Text(snapshot.data[index]['dob']['age'].toString()),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index]['picture']['large'],
                      ),
                    ),
                    subtitle: Text(snapshot.data[index]['email']),
                  )
                ],
              ),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

 Future <void> fetchUsers() async {
  // print(result);
  var result =
      await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
      Map data = jsonDecode(result.body);
      print(data);
      // print(data["gender"]);
      // print(data["name"]);
      // print(data["email"]);
      // print(data["picture"]);
      // print(data["phone"]);
      // print(data);
      // print(data);
  return jsonDecode(result.body)['results'];
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: myApiWidget(response: response1)
    );
  }
  
}
