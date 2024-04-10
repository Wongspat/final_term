import 'dart:convert';
import 'package:final_term/Characters.dart';
import 'package:flutter/material.dart';
import 'package:final_term/Aot_model.dart';
import 'package:http/http.dart' as http;



class AotApi extends StatefulWidget {
  const AotApi({super.key});

  @override
  State<AotApi> createState() => _AotApiState();
}

class _AotApiState extends State<AotApi> {
  Welcome? welcome;
  List<Result> displayList = [];
  List<Result> mainList = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('https://api.attackontitanapi.com/characters'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        welcome = Welcome.fromJson(jsonData);
        setState(() {
          displayList = welcome?.results ?? [];
          mainList = welcome?.results ?? []; // กำหนด mainList เป็นค่าเริ่มต้น
        });
      } else {
        print('Failed to load data. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

    void updateState(String value) {
    setState(() {
      displayList = mainList
          .where((result) =>
              result.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search for a character", 
            style: TextStyle(color: Colors.white,
             fontSize: 22.0,
             fontWeight: FontWeight.bold),
             ),
            SizedBox(height: 20.0,),
            TextField(
              onChanged: (value) => updateState(value), // เรียกใช้งาน updateState โดยส่งค่า value เข้าไป
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Lima",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print('Clicked ID: ${displayList[index].id!}'); // พิมพ์ค่า id ใน console
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActorPage(
                          actor: displayList[index],                  
                          id: displayList[index].id!, // ส่งค่า id ไปยังหน้า ActorPage
                          actorImageList: [],
                        ),
                      ),
                    );
                  },


                  child: ListTile(
                    leading: Icon(Icons.person_2),
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      displayList[index].name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${displayList[index].age!} years old',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    trailing: Text(
                      displayList[index].gender!.name!,
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ), 
      ),
    );
  }
}