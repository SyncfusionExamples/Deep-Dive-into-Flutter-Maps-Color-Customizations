import 'package:flutter/material.dart';
import 'package:myflutterapp/base.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class EqualColorMapping extends StatefulWidget {
  const EqualColorMapping({super.key});

  @override
  State<EqualColorMapping> createState() => _EqualColorMappingState();
}

class _EqualColorMappingState extends State<EqualColorMapping> {
  late MapShapeSource _dataSource;
  late List<_EqualModel> _equalData;

  List<_EqualModel> _generateEqualModel(){
    return <_EqualModel>[
    _EqualModel('California', 11.58, 'High'),
    _EqualModel('Texas', 9.22, 'High'),
    _EqualModel('Florida', 6.84, 'High'),
    _EqualModel('New York', 5.8, 'High'),
    _EqualModel('Pennsylvania', 3.86, 'Medium'),
    _EqualModel('Illinois', 3.73, 'Medium'),
    _EqualModel('Ohio', 3.52, 'Medium'),
    _EqualModel('Georgia', 3.32, 'Medium'),
    _EqualModel('North Carolina', 3.27, 'Medium'),
    _EqualModel('Michigan', 2.99, 'Medium'),
    _EqualModel('New Jersey', 2.78, 'Medium'),
    _EqualModel('Virginia', 2.61, 'Medium'),
    _EqualModel('Washington', 2.33, 'Medium'),
    _EqualModel('Arizona', 2.23, 'Medium'),
    _EqualModel('Tennessee', 2.14, 'Medium'),
    _EqualModel('Massachusetts', 2.09, 'Medium'),
    _EqualModel('Indiana', 2.05, 'Medium'),
    _EqualModel('Missouri', 1.85, 'Medium'),
    _EqualModel('Maryland', 1.84, 'Medium'),
    _EqualModel('Wisconsin', 1.77, 'Medium'),
    _EqualModel('Colorado', 1.76, 'Medium'),
    _EqualModel('Minnesota', 1.72, 'Medium'),
    _EqualModel('South Carolina', 1.63, 'Medium'),
    _EqualModel('Alabama', 1.53, 'Low'),
    _EqualModel('Louisiana', 1.36, 'Low'),
    _EqualModel('Kentucky', 1.35, 'Low'),
    _EqualModel('Oregon', 1.26, 'Low'),
    _EqualModel('Oklahoma', 1.22, 'Low'),
    _EqualModel('Connecticut', 1.08, 'Low'),
    _EqualModel('Utah', 1.03, 'Low'),
    _EqualModel('Iowa', 0.96, 'Low'),
    _EqualModel('Nevada', 0.96, 'Low'),
    _EqualModel('Arkansas', 0.92, 'Low'),
    _EqualModel('Kansas', 0.88, 'Low'),
    _EqualModel('Mississippi', 0.88, 'Low'),
    _EqualModel('New Mexico', 0.63, 'Low'),
    _EqualModel('Idaho', 0.59, 'Low'),
    _EqualModel('Nebraska', 0.59, 'Low'),
    _EqualModel('West Virginia', 0.53, 'Low'),
    _EqualModel('Hawaii', 0.43, 'Low'),
    _EqualModel('New Hampshire', 0.42, 'Low'),
    _EqualModel('Maine', 0.42, 'Low'),
    _EqualModel('Montana', 0.34, 'Low'),
    _EqualModel('Rhode Island', 0.33, 'Low'),
    _EqualModel('Delaware', 0.31, 'Low'),
    _EqualModel('South Dakota', 0.28, 'Low'),
    _EqualModel('North Dakota', 0.23, 'Low'),
    _EqualModel('Alaska', 0.22, 'Low'),
    _EqualModel('Vermont', 0.19, 'Low'),
    _EqualModel('Wyoming', 0.17, 'Low'),
    ];
  }

  List<MapColorMapper> _generateColorMappers(){
    return const <MapColorMapper>[
      MapColorMapper(
        value: 'Low',
        color: Color.fromARGB(255, 135, 206, 250),
        text: 'Low'
      ),
      MapColorMapper(
        value: 'Medium',
        color: Color.fromARGB(255, 255, 165, 0), // Orange for Medium
        text: 'Medium',
      ),
      MapColorMapper(
        value: 'High',
        color: Color.fromARGB(255, 220, 20, 60), // Red for High
        text: 'High',
      ),
    ];
  }

  @override
  void initState() {
    _equalData = _generateEqualModel();

    final MapShapeSource mapShapeSource = MapShapeSource.asset(
      'assets/usa.json',
      shapeDataField: 'name',
      dataCount: _equalData.length,
      primaryValueMapper: (index) => _equalData[index].state,
      shapeColorValueMapper: (index) => _equalData[index].category,
      shapeColorMappers: _generateColorMappers(),
      dataLabelMapper: (index) => '${_equalData[index].percentage.toStringAsFixed(1)}%',
    );

    _dataSource = mapShapeSource;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapWithHeader(
      title: 'Population in Percentage',
      dataSource: _dataSource,
    );
  }
}

class _EqualModel{
  final String state;
  final double percentage;
  final String category;

  _EqualModel(this.state, this.percentage, this.category);
}