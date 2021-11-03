import 'package:flutter/material.dart';
import 'package:rbr/src/router.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'setup',
      routes: routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 20,
          color: Colors.brown[800],
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.elliptical(60, 20)
            ),
            side: BorderSide(
              color: Colors.brown[800]!,
              style: BorderStyle.solid
            )
          )
        )
      ),
    );
  }
}