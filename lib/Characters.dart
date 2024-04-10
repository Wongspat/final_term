import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:final_term/Aot_model.dart';

class ActorPage extends StatelessWidget {
  final Result actor;
  final int id; // เพิ่มตัวแปร index ใน constructor
  final List<String> actorImageList; // เพิ่ม List ใหม่ของชื่อไฟล์รูปภาพ

  const ActorPage({Key? key, required this.actor, required this.id, required this.actorImageList,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // แสดง index ในคอนโซล
    print('Index: $id');
    List<String> actorImageList = [
      'armin.jpg',
      'mikasa.jpg',
      'jean.jpg',
      'conny.jpg',
      'levi.jpg',
      'buchwald.jpg',
      'lima.jpg',
      'hangzoe.jpg',
      'varis.jpg',
      'sasha.jpg',
      'lobov.jpg',
      'ervin.jpg',
      'sandra.jpg',
      'gordon.jpg',
      'mario.jpg',
      'tomas.jpg',
      'dieter.jpg',
      'dirk.jpg',
      'marlen.jpg',
      'klaus.jpg',
    ];

    return Scaffold(
      backgroundColor: Color(Colors.blueAccent.value),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(actor.name,
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // ใช้ชื่อของไฟล์รูปภาพตาม index
              child:
              Image.asset('assets/${actorImageList[id-1]}', width: 500, height: 500),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${actor.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Age: ${actor.age}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Gender: ${actor.gender.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Birthplace: ${actor.birthplace}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Residence: ${actor.residence}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${actor.status}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
