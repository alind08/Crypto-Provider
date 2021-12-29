import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'provider/crypto_list_provider.dart';
import 'view/home.dart';

void main() {
  runApp(
      MultiProvider(
        providers: providers,
      child: const MyApp(),
    )
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CryptoListProvider>(create: (_) => CryptoListProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}






