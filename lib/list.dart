import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugashttpresti/detail.dart'; // Import Detail_Page untuk navigasi

class List_Page extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<List_Page> {
  late Future<List<Character>> _characterList;

  @override
  void initState() {
    super.initState();
    _characterList = _fetchCharacterData();
  }

  Future<List<Character>> _fetchCharacterData() async {
    final response = await http.get(
        Uri.parse('https://hp-api.onrender.com/api/characters/house/gryffindor'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data character');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character List'),
      ),
      body: FutureBuilder<List<Character>>(
        future: _characterList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final character = snapshot.data![index];
                return ListTile(
                  title: Text(character.name),
                  onTap: () {
                    // Navigasi ke halaman detail saat item diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail_Page(character: character),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}