import 'package:flutter/material.dart';
import 'package:myflutterapp/base.dart';
//import 'data_source_color_mapping.dart';
//import 'equal_color_mapping.dart';
import 'range_color_mapping.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CenteredSizedBox(
        //child: DataSourceColorMapping(),
        //child: EqualColorMapping(),
        child: RangeColorMapping()
      ),
    );
  }
}
