import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/textmodel.dart';

import 'Api.dart';
import 'TextAdd.dart';

class WebHome extends StatefulWidget {
  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  Api httpService = Api();
  int length = 2;
  int t = 0;

  String text = "";
  Map<String, String> models = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    models.addAll({"1": ""});
    models.addAll({"2": ""});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Yazlab"),
        backgroundColor: Color.fromARGB(255, 204, 218, 218),
        elevation: 0,
      ),
      body: Center(
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.76,
                  width: MediaQuery.of(context).size.width * 0.6,
                  // color: Colors.red,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 30),
                    itemCount: length,
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 204, 218, 218),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.text_fields_sharp,
                                  color: Colors.white,
                                ),
                                title: Text("TEXT " + (index + 1).toString()),
                              ),
                              TextFormField(
                                maxLines: null,
                                onChanged: (val) {
                                  models[(index + 1).toString()] = val;
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Api().saveTexts(models).then((value) {
                              final snackBar = SnackBar(
                                content: const Text('Veriler Kaydedildi'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );

                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          },
                          child: Text(
                            "Kaydet",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TextAdd(models: models)));
                          },
                          child: Text(
                            "Birlestir",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  )),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            length = length + 1;
            models.addAll({length.toString(): ""});
          });
        },
      ),
    );
  }
}
