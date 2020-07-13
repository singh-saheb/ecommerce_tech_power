import 'package:demo_structure/models/countermodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (_, child, model) => Container(
          child: Text(model.counter.toString() +
              "-- This is the value from ScopedModel")),
    );
  }
}
