import 'dart:math';

import 'package:flutter/material.dart';

class Orientaion extends StatelessWidget {
  var orientation;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery
        .of(context)
        .orientation;
    return Scaffold(
      body: orientation == Orientation.portrait ? Listscreen() : GridScreen(),
    );
  }
}

class Listscreen extends StatelessWidget {
  const Listscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/a/af/How_to_Train_Your_Dragon_2_poster.jpg'))),
        );
      }),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(20, (index) =>
            Container(
              decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
              child: Center(
                child: Text('Grid $index',style: TextStyle(fontSize: 20),),
              ),
            )),
      ),
    );
  }
}
