import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';

/// Rounded rectangle outline drawn as dashes.
///
/// The home wireframe uses this on the quick-start card, status badge,
/// and module icons.
class DashedBorder extends StatelessWidget {
  const DashedBorder({
    super.key,
    required this.child,
    this.color = AppColors.gold,
    this.radius = AppRadius.lg,
    this.strokeWidth = 1.2,
    this.dashWidth = 5,
    this.dashGap = 3.5,
  });

  final Widget child;
  final Color color;
  final double radius;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedRRectPainter(
        color: color,
        radius: radius,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashGap: dashGap,
      ),
      child: child,
    );
  }
}

class DashedRRectPainter extends CustomPainter {
  const DashedRRectPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashGap,
  });

  final Color color;
  final double radius;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    final rect = Offset.zero & size;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect.deflate(strokeWidth / 2),
          Radius.circular(radius),
        ),
      );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(DashedRRectPainter oldDelegate) {
    return color != oldDelegate.color ||
        radius != oldDelegate.radius ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashWidth != oldDelegate.dashWidth ||
        dashGap != oldDelegate.dashGap;
  }
}
