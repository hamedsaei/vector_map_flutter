import 'package:flutter/painting.dart';
import 'package:vector_map/src/data/map_data_source.dart';
import 'package:vector_map/src/theme/map_highlight_theme.dart';
import 'package:vector_map/src/theme/map_theme.dart';

/// Layer for [VectorMap].
class MapLayer {
  MapLayer(
      {required this.dataSource,
      MapTheme? theme,
      this.hoverTheme,
      this.highlightTheme,
      this.name})
      : this.theme = theme != null ? theme : MapTheme();

  final MapDataSource dataSource;
  final MapTheme theme;
  final MapTheme? hoverTheme;
  final MapHighlightTheme? highlightTheme;
  final String? name;

  /// Indicates if the hover is drawable, if there is any hover theme and
  /// if it has a set value.
  bool get hoverDrawable {
    return hoverTheme != null && hoverTheme!.hasValue();
  }

  /// Gets the bounds of the layers. Returns [NULL] if the list is empty.
  static Rect? boundsOf(List<MapLayer> layers) {
    Rect? bounds;
    if (layers.isNotEmpty) {
      bounds = layers.first.dataSource.bounds;
      for (MapLayer layer in layers) {
        bounds = bounds!.expandToInclude(layer.dataSource.bounds);
      }
    }
    return bounds;
  }
}