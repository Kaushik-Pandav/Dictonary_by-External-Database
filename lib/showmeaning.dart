import 'package:dictonary/HomePage.dart';
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
      backgroundColor: Color.fromARGB(255, 240, 237, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 52, 63),
        title: Text(
          "Offline Dictionary",
          style: TextStyle(
            color: Color.fromARGB(255, 240, 237, 204),
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Word",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              subtitle: Text(
                widget.word,
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 2, 52, 63),
                ),
              ),
            ),
            ListTile(
              title: Text("Hindi Meaning", style: TextStyle(fontSize: 20)),
              subtitle: Text(
                widget.meaning,
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 2, 52, 63),
                ),
              ),
            ),
            Spacer(),
            Card(
              elevation: 15,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 2, 52, 63)
                ),
                 height: 50,
                child: TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Let's Get Some More......",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 240, 237, 204), ),)),
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
