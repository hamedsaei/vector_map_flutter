import 'package:vector_map/src/data/map_layer.dart';
import 'package:vector_map/src/addon/map_addon.dart';

/// Abstract legend
abstract class Legend extends MapAddon {
  /// Builds a legend
  Legend({required this.layer});
  final MapLayer layer;
}