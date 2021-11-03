import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbr/src/providers/red_neuronal_provider.dart';
import 'package:rbr/src/router.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => RedNeuronalProvider(), lazy: false)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'training',
        routes: routes,
        theme: ThemeData(
          primaryColor: Colors.brown[800],
          backgroundColor: Colors.brown[50],
          disabledColor: Colors.brown[200],
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
      ),
    );
  }
}