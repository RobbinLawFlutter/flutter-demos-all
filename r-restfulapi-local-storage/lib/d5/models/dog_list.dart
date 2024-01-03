// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/d5/models/dog.dart';

class DogList extends StatefulWidget {
  const DogList ({required this.dogs});

  final List<Dog> dogs;

  @override
  State<StatefulWidget> createState() {
    return _DogListState();
  }
}

class _DogListState extends State<DogList> {
  @override
  Widget build(BuildContext context) {
    return _buildDogList(context, widget.dogs);
  }

  ListView _buildDogList(context, List<Dog> dogs) {
    return ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('name: ${dogs[index].name}'),
            subtitle: Text('id: ${dogs[index].id}'),
            trailing: Text('age: ${dogs[index].age}'),
          ),
        );
      },
    );
  }
}
