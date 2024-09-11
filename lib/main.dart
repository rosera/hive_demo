import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Package: Path Provider - get the location path used
  final docDirectory = await getApplicationDocumentsDirectory();

  // Initialize Hive
  Hive.init(docDirectory.path);
  print('Box Path: ${docDirectory.path}');

  // await Hive.initFlutter();

  // Open the database box
  // var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Hive Demo'),
    );
  }
}
