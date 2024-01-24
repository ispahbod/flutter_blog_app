import 'package:flutter/material.dart';

int screenNumber = 1;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen #$screenNumber',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                screenNumber++;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              child: const Text('Click Me')),
        ],
      ),
    );
  }
}
