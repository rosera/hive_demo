import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box? _boxDatabase;
  final String boxFilename = "boxDb";
  TextEditingController writeBoxField = TextEditingController();
  TextEditingController readBoxField  = TextEditingController();
  TextEditingController deleteBoxField  = TextEditingController();

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Open Hive storage box
    Hive.openBox(boxFilename).then((box) {
      // Store the box reference
      _boxDatabase = box;
    });
  }

  // Write
  void writeData() {
    // Write the Key/Value pair
    _boxDatabase?.put(1, writeBoxField.text);
    print('Write action');
  }

  // Read
  void readData() {
    // Read the Key/Value pair
    // print(_boxDatabase?.get(1));

    // Validate data entry
    readBoxField.text = _boxDatabase?.get(1) ?? "No Record";
  }

  // Delete
  void deleteData() {
    // Delete the Key/Value pair
    print(_boxDatabase?.delete(1));
    print('Delete action');
    deleteBoxField.text = "Record deleted";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hive Demo"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Database Info:", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                      width: double.infinity,
                      child:
                      Text("Database: $boxFilename"),
                  ),
                  const Divider(),
                  const SizedBox(height:10),

                  const Text("Write Database:", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const Text("Press the button to read from the database:", style: TextStyle(fontSize: 16.0)),
                  Card(
                    // color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // Adjust the radius as needed
                      side: const BorderSide(
                        // color: Colors.grey.withOpacity(0.5),
                        // Set the opacity to 0.5 (50%)
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: TextField(
                              controller: writeBoxField,
                              decoration:
                                  const InputDecoration(hintText: 'Database Input'),
                            ),
                          ),
                          MaterialButton(
                            onPressed: writeData,
                            color: Colors.blue,
                            child: const Text('Write'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),

                  const Text("Database Read:", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const Text("Press the button to read from the database:", style: TextStyle(fontSize: 16.0)),
                  Card(
                    // color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // Adjust the radius as needed
                      side: const BorderSide(
                        // color: Colors.grey.withOpacity(0.5),
                        // Set the opacity to 0.5 (50%)
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: TextField(
                              controller: readBoxField,
                              readOnly: true,
                              decoration:
                              const InputDecoration(hintText: 'Database output'),
                            ),
                          ),
                          MaterialButton(
                            onPressed: readData,
                            color: Colors.blue,
                            child: const Text('Read'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text("Database Delete:", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const Text("Press the button to delete from the database:", style: TextStyle(fontSize: 16.0)),
                  Card(
                    // color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // Adjust the radius as needed
                      side: const BorderSide(
                        // color: Colors.grey.withOpacity(0.5),
                        // Set the opacity to 0.5 (50%)
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            child: TextField(
                              controller: deleteBoxField,
                              readOnly: true,
                              decoration:
                              const InputDecoration(hintText: 'Database deletion'),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: deleteData,
                              color: Colors.blue,
                              child: const Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
