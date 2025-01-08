import 'package:flutter/material.dart';
import 'package:myflutterapp/base.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class RangeColorMapping extends StatefulWidget {
  const RangeColorMapping({super.key});

  @override
  State<RangeColorMapping> createState() => _RangeColorMappingState();
}

class _RangeColorMappingState extends State<RangeColorMapping> {
  
  late MapShapeSource _dataSource;
  late List<_RangeModel> _rangeData;

  List<_RangeModel> _generateRangeData(){
    return <_RangeModel>[
      _RangeModel('Alabama', 67.98),
      _RangeModel('Alaska', 69.72),
      _RangeModel('Arizona', 71.27),
      _RangeModel('Arkansas', 70.64),
      _RangeModel('California', 81.56),
      _RangeModel('Colorado', 76.06),
      _RangeModel('Connecticut', 74.44),
      _RangeModel('Delaware', 60.13),
      _RangeModel('Florida', 58.69),
      _RangeModel('Georgia', 70.90),
      _RangeModel('Hawaii', 64.80),
      _RangeModel('Idaho', 84.16),
      _RangeModel('Illinois', 71.31),
      _RangeModel('Indiana', 61.33),
      _RangeModel('Lowa', 64.10),
      _RangeModel('Kansas', 78.19),
      _RangeModel('Kentucky', 57.72),
      _RangeModel('Louisiana', 76.60),
      _RangeModel('Maine', 62.80),
      _RangeModel('Maryland', 61.53),
      _RangeModel('Massachusetts', 56.92),
      _RangeModel('Michigan', 57.22),
      _RangeModel('Minnesota', 66.19),
      _RangeModel('Mississippi', 79.29),
      _RangeModel('Missouri', 56.19),
      _RangeModel('Montana', 79.88),
      _RangeModel('Nebraska', 72.81),
      _RangeModel('Nevada', 66.87),
      _RangeModel('New Hampshire', 78.90),
      _RangeModel('New Jersey', 77.68),
      _RangeModel('New Mexico', 56.87),
      _RangeModel('New York', 80.93),
      _RangeModel('North Carolina', 71.31),
      _RangeModel('North Dakota', 67.50),
      _RangeModel('Ohio', 68.35),
      _RangeModel('Oklahoma', 63.21),
      _RangeModel('Oregon', 75.12),
      _RangeModel('Pennsylvania', 68.75),
      _RangeModel('Rhode Island', 74.02),
      _RangeModel('South Carolina', 72.60),
      _RangeModel('South Dakota', 65.80),
      _RangeModel('Tennessee', 67.10),
      _RangeModel('Texas', 62.50),
      _RangeModel('Utah', 66.30),
      _RangeModel('Vermont', 83.22),
      _RangeModel('Virginia', 70.40),
      _RangeModel('Washington', 73.89),
      _RangeModel('West Virginia', 56.75),
      _RangeModel('Wisconsin', 79.50),
      _RangeModel('Wyoming', 61.93),
    ];
  }

  List<MapColorMapper> _generateColorMappers(){
    return const <MapColorMapper>[
      MapColorMapper(
        from: 50,
        to: 60,
        color: Color.fromARGB(50, 3, 182, 12),
        text: '50% - 60%'
      ),
      MapColorMapper(
        from: 60,
        to: 70,
        color: Color.fromARGB(100, 85, 181, 80),
        text: '60% - 70%',
      ),
      MapColorMapper(
        from: 70,
        to: 80,
        color: Color.fromARGB(150, 37, 170, 84),
        text: '70% - 80%',
      ),
      MapColorMapper(
        from: 80,
        to: 90,
        color: Color.fromARGB(200, 12, 170, 4),
        text: '80% - 90%',
      ),
      MapColorMapper(
        from: 90,
        to: 100,
        color: Color.fromARGB(255, 13, 188, 4),
        text: '90% - 100%',
      ),
    ];
  }

  @override
  void initState() {
    _rangeData = _generateRangeData();

    final MapShapeSource mapShapeSource = MapShapeSource.asset(
      'assets/usa.json',
      shapeDataField: 'name',
      dataCount: _rangeData.length,
      primaryValueMapper: (index) => _rangeData[index].state,
      shapeColorValueMapper: (index) => _rangeData[index].votePercentage,
      shapeColorMappers: _generateColorMappers()
    );

    _dataSource = mapShapeSource;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapWithHeader(
      title: 'Voting Range in Percentage',
      dataSource: _dataSource,
    );
  }
}

class _RangeModel{
  final String state;
  final double votePercentage;

  _RangeModel(this.state, this.votePercentage);
}
