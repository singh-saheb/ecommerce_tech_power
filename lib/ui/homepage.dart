import 'package:demo_structure/models/fact.dart';
import 'package:demo_structure/service/apiService.dart';
import 'package:flutter/material.dart';

import '../service/apiService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  List<Fact> facts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: apiService.getFacts(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              facts = snapshot.data;
              return ListView.builder(
                  itemCount: facts.isEmpty ? 0 : facts.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Image.network(facts[index].imageUrl),
                        Text(facts[index].title),
                      ],
                    );
                  });
            } else {
              return Text(snapshot.error.toString());
            }
          }),
    );
  }
}
