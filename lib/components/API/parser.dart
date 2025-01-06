import 'package:fl_chart/fl_chart.dart';
import 'post.dart';

List<FlSpot> parseDataToSpots(List<Album> albums) {
  return albums
      .map((album) => FlSpot(
            double.parse(album.timestamp.split(':')[0]), // Extract hour
            album.temperature as double, // Map temperature
          ))
      .toList();
}
