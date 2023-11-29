import 'package:flutter/material.dart';
import 'package:flutter_database_bank_details/bank_details_list_screen_v1.dart';
import 'database_helper.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BankDetailsListScreenv1(),
    );
  }
}



