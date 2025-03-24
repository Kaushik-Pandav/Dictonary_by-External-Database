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
    //
    // get();
    // HomePage
    // GetalDatas();
  }

  @override
  Widget build(BuildContext context) {
    print("===PP${controller}");
    return Scaffold(
      appBar:
          search
              ? AppBar(
                backgroundColor: Colors.white,
                title: TextField(
                  onChanged: (value) {
                    searchList = [];
                    setState(() {
                      for (int i = 0; i < controller!.allword.value.length; i++) {
                        if (controller!.allword.value[i].word.toLowerCase().contains(
                          value.toLowerCase(),
                        )) {
                          searchList.add(controller!.allword.value[i]);
                        }
                      }
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchList = controller!.allword.value;
                          search = false;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              )
              : AppBar(
                backgroundColor: Colors.blue,
                title: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchList = controller!.allword.value;
                          search = true;
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${searchList[index].word}"),
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
  }

  // Future<void> create() async {
  //   search = false;
  //   // controller.database = await controller.createdatabase();
  // }

  // void GetalDatas() {
  //
  //   controller!.getdata().then((value) {
  //
  //   },);
  //
  // }
  // void get() {
  //   controller!.getdata(controller!.database!).then((value) {
  //     HomePage.allword = value;
  //     searchList = value;
  //   });
  //   setState(() {});
  // }
}
