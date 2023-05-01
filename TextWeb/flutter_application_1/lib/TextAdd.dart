import 'dart:async';

import 'package:flutter/material.dart';

import 'Api.dart';
import 'models/textmodel.dart';

class TextAdd extends StatefulWidget {
  Map<String, String> models;

  TextAdd({required this.models});
  @override
  State<TextAdd> createState() => _TextAddState(models: models);
}

class _TextAddState extends State<TextAdd> {
  Map<String, String> models;

  List<String> text = [];
  _TextAddState({
    required this.models,
  });
  Future<void> gettext() async {
    String t = '(await Api().getConnection(models))';
    text.add(t);
  }

  Stopwatch stopwatch = Stopwatch()..start();

//your logic here

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yazlab"),
        backgroundColor: Color.fromARGB(255, 204, 218, 218),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          // padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: FutureBuilder(
            future: Api().newTexts(
                models), // a previously-obtained Future<String> or null
            builder: (BuildContext context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                stopwatch.stop();
                children = <Widget>[
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.76,
                        width: MediaQuery.of(context).size.width * 0.46,
                        //color: Colors.blueAccent,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 30),
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 30),
                          itemCount: models.length,
                          scrollDirection: Axis.vertical,
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 218, 218),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.text_fields_sharp),
                                      title: Text(
                                          "TEXT " + (index + 1).toString()),
                                    ),
                                    Text(
                                      models[(index + 1).toString()].toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.76,
                        width: MediaQuery.of(context).size.width * 0.46,
                        decoration: BoxDecoration(
                            // color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: EdgeInsets.only(
                            left: 0, right: 20, top: 20, bottom: 30),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                                size: 60,
                              ),
                              Center(
                                child: Text("${stopwatch.elapsedMilliseconds}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ];
              } else {
                // startTimer();
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  ),
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
