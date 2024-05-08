import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imageUrl;
  final String gender;
  final String house;
  final String actor;

  Character({
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.house,
    required this.actor,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['image'],
      gender: json['gender'],
      house: json['house'],
      actor: json['actor'],
    );
  }
}

class Detail_Page extends StatelessWidget {
  final Character character;

  Detail_Page({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(character.imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              'Gender: ${character.gender}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'House: ${character.house}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Actor: ${character.actor}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
