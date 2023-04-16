import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

double getTextSize(String text, {TextStyle? style}) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size.width;
}

String calculateDistance(double lat1, double lon1, double lat2, double lon2) =>
    (Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1e3)
        .toStringAsFixed(2);

String calculateTime(String distance) {
  double? dist = double.tryParse(distance);
  if (dist == null) {
    return '';
  } else {
    Duration time = Duration(milliseconds: (dist / (4.8) * 3.6e+6).toInt());

    if (time.inHours < 1) {
      return '${time.inMinutes} mins';
    } else if (time.inHours < 10) {
      if (time.inMinutes - time.inHours * 60 < 30) {
        return '~ ${time.inHours} hrs';
      } else {
        return '~ ${time.inHours + 1} hrs';
      }
    } else if (time.inHours < 24) {
      return '> 10 hrs';
    } else {
      return '';
    }
  }
}
