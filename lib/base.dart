import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class CenteredSizedBox extends StatelessWidget {
  const CenteredSizedBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: screenSize.height * 0.90,
          width: screenSize.width * 0.90,
          child: child,
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MapWithHeader extends StatelessWidget {
  const MapWithHeader({
    super.key,
    required this.title,
    required this.dataSource,
  });

  final String title;
  final MapShapeSource dataSource;

  MapShapeLayer _buildMapShapeLayer(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return MapShapeLayer(
      source: dataSource,
      color: Colors.white,
      strokeColor: const Color.fromARGB(255, 6, 89, 2),
      strokeWidth: 0.5,
      showDataLabels: true,
      dataLabelSettings: MapDataLabelSettings(
        overflowMode: MapLabelOverflow.hide,
        textStyle: themeData.textTheme.labelSmall!.copyWith(
          color: themeData.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderText(title: title),
        const SizedBox(height: 10),
        Expanded(
          child: SfMaps(
            layers: <MapShapeLayer>[
              _buildMapShapeLayer(context),
            ],
          ),
        ),
      ],
    );
  }
}
