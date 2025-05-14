import 'package:dictonary/database_controller.dart';
import 'package:dictonary/modelwordmeaning.dart';
import 'package:dictonary/showmeaning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController c = TextEditingController();
  Databasehelper? controller;

  List<Word> searchList = [];
  bool search = false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(Databasehelper());
    searchList = controller!.allword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 237, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 52, 63),
        title: Text(
          "Offline Dictionary",
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 240, 237, 204),
          ),
        ),
      ),
      body: Column(
        children: [
          search
              ? Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  onTap: () {
                    setState(() {
                      searchList = controller!.allword;
                      search = false;
                    });
                  },
                  onChanged: (value) {
                    searchList = [];
                    setState(() {
                      for (int i = 0; i < controller!.allword.length; i++) {
                        if (controller!.allword[i].word.toLowerCase().startsWith(
                          value.toLowerCase(),
                        )) {
                          searchList.add(controller!.allword[i]);
                        }
                      }
                    });
                  },
                  decoration: InputDecoration(
                    label: Text("Search"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchList = controller!.allword;
                          search = false;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              )
              : Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      searchList = controller!.allword;
                      search = true;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    label: Text("Search"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchList = controller!.allword;
                          search = true;
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      searchList[index].word,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 2, 52, 63),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return showData(
                              word: searchList[index].word,
                              meaning: searchList[index].meaning,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
