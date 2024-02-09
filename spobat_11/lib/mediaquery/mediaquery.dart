import 'package:flutter/material.dart';

class Mainpagemedia extends StatefulWidget {
  const Mainpagemedia({super.key});

  @override
  State<Mainpagemedia> createState() => _MainpagemediaState();
}

class _MainpagemediaState extends State<Mainpagemedia> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isLargeScreen = width > 600;
    return Scaffold(
      body: isLargeScreen == true ? BigScreen() : MobileScreen(),
    );
  }
}

class BigScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Big Screen'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.greenAccent
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.pink.shade50,
                  child: Text('Video $index'),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class MobileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Mobile Screen'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.greenAccent
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.pink.shade50,
                  child: Text('Video $index'),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
