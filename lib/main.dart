import 'package:dio_bloc/bloc/covid_bloc.dart';
import 'package:dio_bloc/page/covid-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CovidBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CovidPage(),
      ),
    );
  }
}
