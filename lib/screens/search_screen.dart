import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (value) {
              cityName = value;
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Enter City'),
          ),
        ),
      ),
    );
  }
}
