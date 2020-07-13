import 'dart:developer';

import 'package:demo_structure/models/countermodel.dart';
import 'package:demo_structure/models/fact.dart';
import 'package:demo_structure/service/apiService.dart';
import 'package:demo_structure/ui/secondWidget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../service/apiService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterModel c = CounterModel();
  ApiService apiService = ApiService();
  List<Fact> facts;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
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
                          SecondWidget()
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
