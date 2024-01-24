import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
int screenNumber = 1;
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen #$screenNumber',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
              onPressed: () {
                screenNumber++;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Text('Click Me')),
        ],
      ),
    );
  }
}
