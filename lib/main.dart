import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map? mapResponse;
  Map? mapJsonData;
  List? dataList;

  Future fetchData() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

      mapResponse = jsonDecode(response.body) as Map;

      setState(() {
        mapJsonData = mapResponse;
        dataList = mapJsonData?["data"];
        print(dataList);
        // print(_jsonPost);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Api Call",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        drawer:Drawer(
          backgroundColor: Colors.green[100],
          elevation: 6.0,
          child:ListView(
            children: [
              DrawerHeader(
                decoration:BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.greenAccent,
                      Colors.lightGreen,
                    ],
                  )
                ),
                child: Text("sanny"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.lightGreen,
                  ),
                  title: Text("person"),
                  onTap: (){},

                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.lightGreen,
                  ),
                  title: Text("person"),
                  onTap: (){},

                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.lightGreen,
                  ),
                  title: Text("person"),
                  onTap: (){},

                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.lightGreen,
                  ),
                  title: Text("person"),
                  onTap: (){},

                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.lightGreen,
                  ),
                  title: Text("person"),
                  onTap: (){},

                ),
            ],
          )
        ) ,
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: dataList?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Image.network(dataList![index]["avatar"]),
                          Text(dataList![index]["id"].toString()),
                          Text(dataList?[index]["first_name"]),
                          Text(dataList?[index]["last_name"]),
                          Text(dataList?[index]["email"]),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
