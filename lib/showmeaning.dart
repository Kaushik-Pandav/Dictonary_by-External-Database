import 'package:flutter/material.dart';

class showData extends StatefulWidget {
  const showData({super.key, required this.word, required this.meaning});
  final String word;
  final String meaning;
  @override
  State<showData> createState() => _showDataState();
}

class _showDataState extends State<showData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hindi Dictonary")),
      body: Column(
        children: [
          ListTile(
              title: Text("Word"),
              subtitle: Text("${widget.word}",style: TextStyle(fontSize: 35),
              )
          ),ListTile(
              title: Text("Hindi Meaning"),
              subtitle: Text("${widget.meaning}",style: TextStyle(fontSize: 35),
              )
          )
        ],
      )
    );
  }
}
