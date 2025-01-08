import 'package:flutter/material.dart';
import 'package:myflutterapp/base.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class DataSourceColorMapping extends StatefulWidget {
  const DataSourceColorMapping({super.key});

  @override
  State<DataSourceColorMapping> createState() => _DataSourceColorMappingState();
}

class _DataSourceColorMappingState extends State<DataSourceColorMapping> {

  late MapShapeSource _dataSource;
  late List<_DataModel> _data;

  List<_DataModel> _generateDataModel(){
    return <_DataModel>[
      _DataModel('Alabama', const Color.fromARGB(255, 255, 99, 71)),
      _DataModel('Alaska', const Color.fromARGB(255, 50, 115, 220)),
      _DataModel('Arizona', const Color.fromARGB(255, 255, 179, 71)),
      _DataModel('Arkansas', const Color.fromARGB(255, 71, 255, 123)),
      _DataModel('California', const Color.fromARGB(255, 71, 209, 255)),
      _DataModel('Colorado', const Color.fromARGB(255, 155, 71, 255)),
      _DataModel('Connecticut', const Color.fromARGB(255, 220, 50, 115)),
      _DataModel('Delaware', const Color.fromARGB(255, 255, 217, 71)),
      _DataModel('Florida', const Color.fromARGB(255, 71, 255, 198)),
      _DataModel('Georgia', const Color.fromARGB(255, 99, 255, 71)),
      _DataModel('Hawaii', const Color.fromARGB(255, 255, 71, 179)),
      _DataModel('Idaho', const Color.fromARGB(255, 71, 142, 255)),
      _DataModel('Illinois', const Color.fromARGB(255, 194, 71, 255)),
      _DataModel('Indiana', const Color.fromARGB(255, 255, 50, 217)),
      _DataModel('Lowa', const Color.fromARGB(255, 255, 158, 71)),
      _DataModel('Kansas', const Color.fromARGB(255, 71, 255, 144)),
      _DataModel('Kentucky', const Color.fromARGB(255, 71, 221, 255)),
      _DataModel('Louisiana', const Color.fromARGB(255, 184, 71, 255)),
      _DataModel('Maine', const Color.fromARGB(255, 255, 71, 142)),
      _DataModel('Maryland', const Color.fromARGB(255, 255, 71, 71)),
      _DataModel('Massachusetts', const Color.fromARGB(255, 50, 255, 71)),
      _DataModel('Michigan', const Color.fromARGB(255, 255, 123, 71)),
      _DataModel('Minnesota', const Color.fromARGB(255, 255, 71, 198)),
      _DataModel('Mississippi', const Color.fromARGB(255, 50, 209, 255)),
      _DataModel('Missouri', const Color.fromARGB(255, 209, 71, 255)),
      _DataModel('Montana', const Color.fromARGB(255, 115, 50, 255)),
      _DataModel('Nebraska', const Color.fromARGB(255, 71, 255, 209)),
      _DataModel('Nevada', const Color.fromARGB(255, 255, 179, 71)),
      _DataModel('New Hampshire', const Color.fromARGB(255, 255, 99, 71)),
      _DataModel('New Jersey', const Color.fromARGB(255, 99, 50, 255)),
      _DataModel('New Mexico', const Color.fromARGB(255, 255, 144, 71)),
      _DataModel('New York', const Color.fromARGB(255, 50, 71, 255)),
      _DataModel('North Carolina', const Color.fromARGB(255, 71, 255, 123)),
      _DataModel('North Dakota', const Color.fromARGB(255, 255, 217, 71)),
      _DataModel('Ohio', const Color.fromARGB(255, 194, 255, 71)),
      _DataModel('Oklahoma', const Color.fromARGB(255, 142, 71, 255)),
      _DataModel('Oregon', const Color.fromARGB(255, 255, 71, 115)),
      _DataModel('Pennsylvania', const Color.fromARGB(255, 255, 71, 71)),
      _DataModel('Rhode Island', const Color.fromARGB(255, 71, 255, 142)),
      _DataModel('South Carolina', const Color.fromARGB(255, 71, 255, 209)),
      _DataModel('South Dakota', const Color.fromARGB(255, 50, 71, 255)),
      _DataModel('Tennessee', const Color.fromARGB(255, 71, 123, 255)),
      _DataModel('Texas', const Color.fromARGB(255, 255, 71, 255)),
      _DataModel('Utah', const Color.fromARGB(255, 255, 71, 144)),
      _DataModel('Vermont', const Color.fromARGB(255, 179, 50, 255)),
      _DataModel('Virginia', const Color.fromARGB(255, 71, 255, 179)),
      _DataModel('Washington', const Color.fromARGB(255, 71, 198, 255)),
      _DataModel('West Virginia', const Color.fromARGB(255, 255, 115, 71)),
      _DataModel('Wisconsin', const Color.fromARGB(255, 50, 255, 179)),
      _DataModel('Wyoming', const Color.fromARGB(255, 115, 71, 255)),
    ];
  }

  @override
  void initState() {
    _data = _generateDataModel();

    final MapShapeSource mapShapeSource = MapShapeSource.asset(
      'assets/usa.json',
      shapeDataField: 'name',
      dataCount: _data.length,
      primaryValueMapper: (index) => _data[index].state,
      shapeColorValueMapper: (index) => _data[index].color,
    );

    _dataSource = mapShapeSource;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapWithHeader(
      title: 'Individual State Representation',
      dataSource: _dataSource,
    );
  }
}

class _DataModel{
  final String state;
  final Color color;

  _DataModel(this.state, this.color);
}