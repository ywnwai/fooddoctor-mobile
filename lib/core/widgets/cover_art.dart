import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';

enum CoverKind {
  bakery,
  beverage,
  dairy,
  snack,
  sauce,
  raw,
  packaging,
  machinery,
  additive,
  expert,
  job,
  blog,
  knowledge,
  supplier,
  video,
  document,
}

CoverKind coverForId(String id) {
  if (id.contains('bakery')) return CoverKind.bakery;
  if (id.contains('beverage') || id.contains('water')) {
    return CoverKind.beverage;
  }
  if (id.contains('dairy')) return CoverKind.dairy;
  if (id.contains('snack') || id.contains('allergen')) return CoverKind.snack;
  if (id.contains('sauce') || id.contains('cold-chain')) {
    return CoverKind.sauce;
  }
  if (id.contains('pack') || id.contains('label') || id.contains('pouch') ||
      id.contains('carton') || id.contains('bottle') || id.contains('jar')) {
    return CoverKind.packaging;
  }
  if (id.contains('machine') || id.contains('filler') || id.contains('mixer') ||
      id.contains('sealer') || id.contains('spares') || id.contains('delta')) {
    return CoverKind.machinery;
  }
  if (id.contains('acid') || id.contains('additive') || id.contains('flavour')) {
    return CoverKind.additive;
  }
  if (id.contains('gmp') || id.contains('gov') || id.contains('pdf')) {
    return CoverKind.document;
  }
  if (id.contains('job') || id.contains('qa') || id.contains('line') ||
      id.contains('pack-')) {
    return CoverKind.job;
  }
  if (id.contains('expert') || id.contains('khin') || id.contains('su-mon') ||
      id.contains('htet') || id.contains('thazin')) {
    return CoverKind.expert;
  }
  return CoverKind.knowledge;
}

/// Illustrated cover used in place of product photography.
///
/// Shapes stay abstract so the screen looks finished without stock photos.
class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.kind,
    this.width,
    this.height = 168,
    this.radius = AppRadius.xl,
    this.showPlay = false,
  });

  final CoverKind kind;
  final double? width;
  final double height;
  final double radius;
  final bool showPlay;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(painter: _CoverPainter(kind)),
            if (showPlay)
              const Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xE6FFFDF9),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.goldInk,
                      size: 32,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CoverPainter extends CustomPainter {
  const _CoverPainter(this.kind);

  final CoverKind kind;

  @override
  void paint(Canvas canvas, Size size) {
    final palette = _palette(kind);
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [palette.$1, palette.$2],
        ).createShader(rect),
    );

    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.18),
      size.shortestSide * 0.38,
      Paint()..color = palette.$3.withValues(alpha: 0.22),
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.18, size.height * 0.78),
        width: size.width * 0.7,
        height: size.height * 0.55,
      ),
      Paint()..color = AppColors.white.withValues(alpha: 0.16),
    );
    canvas.drawCircle(
      Offset(size.width * 0.62, size.height * 0.7),
      size.shortestSide * 0.2,
      Paint()..color = palette.$3.withValues(alpha: 0.28),
    );

    _drawMotif(canvas, size, palette.$3);
  }

  void _drawMotif(Canvas canvas, Size size, Color ink) {
    final paint = Paint()
      ..color = ink.withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    switch (kind) {
      case CoverKind.bakery:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy + 8), width: 78, height: 36),
            const Radius.circular(18),
          ),
          paint,
        );
        canvas.drawOval(
          Rect.fromCenter(center: Offset(cx, cy - 10), width: 70, height: 28),
          paint,
        );
      case CoverKind.beverage:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy + 10), width: 28, height: 62),
            const Radius.circular(8),
          ),
          paint,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy - 28), width: 16, height: 16),
            const Radius.circular(4),
          ),
          paint,
        );
      case CoverKind.dairy:
        canvas.drawCircle(Offset(cx, cy), 28, paint);
        canvas.drawCircle(Offset(cx + 22, cy + 8), 18, paint);
      case CoverKind.snack:
        for (var i = 0; i < 5; i++) {
          canvas.drawOval(
            Rect.fromCenter(
              center: Offset(cx - 24 + i * 12.0, cy + (i.isEven ? -6 : 8)),
              width: 22,
              height: 14,
            ),
            paint,
          );
        }
      case CoverKind.sauce:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy + 6), width: 36, height: 48),
            const Radius.circular(10),
          ),
          paint,
        );
        canvas.drawCircle(Offset(cx, cy - 22), 10, paint);
      case CoverKind.packaging:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 54, height: 40),
            const Radius.circular(6),
          ),
          paint,
        );
      case CoverKind.machinery:
        canvas.drawCircle(Offset(cx, cy), 22, paint);
        canvas.drawRect(
          Rect.fromCenter(center: Offset(cx, cy), width: 10, height: 52),
          paint,
        );
      case CoverKind.raw:
      case CoverKind.additive:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 46, height: 56),
            const Radius.circular(8),
          ),
          paint,
        );
      case CoverKind.expert:
        canvas.drawCircle(Offset(cx, cy - 8), 18, paint);
        canvas.drawOval(
          Rect.fromCenter(center: Offset(cx, cy + 22), width: 40, height: 24),
          paint,
        );
      case CoverKind.job:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 50, height: 36),
            const Radius.circular(6),
          ),
          paint,
        );
      case CoverKind.video:
        final path = Path()
          ..moveTo(cx - 10, cy - 16)
          ..lineTo(cx + 18, cy)
          ..lineTo(cx - 10, cy + 16)
          ..close();
        canvas.drawPath(path, paint);
      case CoverKind.document:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 36, height: 48),
            const Radius.circular(4),
          ),
          paint,
        );
      case CoverKind.blog:
      case CoverKind.knowledge:
      case CoverKind.supplier:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(cx, cy), width: 58, height: 34),
            const Radius.circular(10),
          ),
          paint,
        );
    }
  }

  (Color, Color, Color) _palette(CoverKind kind) {
    return switch (kind) {
      CoverKind.bakery => (
        const Color(0xFFE8C48A),
        const Color(0xFFC47A2C),
        const Color(0xFF6B3E12),
      ),
      CoverKind.beverage => (
        const Color(0xFF8FBF8A),
        const Color(0xFF2F5D4A),
        const Color(0xFF143026),
      ),
      CoverKind.dairy => (
        const Color(0xFFE8E4D4),
        const Color(0xFF9BB0C4),
        const Color(0xFF3E4F60),
      ),
      CoverKind.snack => (
        const Color(0xFFF0B36A),
        const Color(0xFFC45C1E),
        const Color(0xFF6A2E0C),
      ),
      CoverKind.sauce => (
        const Color(0xFFE08A68),
        const Color(0xFF8A2E1C),
        const Color(0xFF3E120C),
      ),
      CoverKind.raw => (
        const Color(0xFFD8C4A0),
        const Color(0xFF8A6A3C),
        const Color(0xFF3E2C14),
      ),
      CoverKind.packaging => (
        const Color(0xFFE6D2B4),
        const Color(0xFFA07848),
        const Color(0xFF4A3018),
      ),
      CoverKind.machinery => (
        const Color(0xFF9AA8B8),
        const Color(0xFF1A2744),
        const Color(0xFF0C1424),
      ),
      CoverKind.additive => (
        const Color(0xFFC8D8B8),
        const Color(0xFF4A6A3C),
        const Color(0xFF223418),
      ),
      CoverKind.expert => (
        const Color(0xFFF3D56A),
        const Color(0xFF000080),
        const Color(0xFF0A0A40),
      ),
      CoverKind.job => (
        const Color(0xFF8CBC8A),
        const Color(0xFF1F4A32),
        const Color(0xFF0E2418),
      ),
      CoverKind.blog => (
        const Color(0xFFDEAE0E),
        const Color(0xFF000080),
        const Color(0xFF1A1814),
      ),
      CoverKind.knowledge => (
        const Color(0xFFF0D878),
        const Color(0xFF3A2A08),
        const Color(0xFF1A1408),
      ),
      CoverKind.supplier => (
        const Color(0xFFD2B48C),
        const Color(0xFF4A3420),
        const Color(0xFF1E140C),
      ),
      CoverKind.video => (
        const Color(0xFF000080),
        const Color(0xFF3A2A60),
        const Color(0xFFF8F1D4),
      ),
      CoverKind.document => (
        const Color(0xFFE8DFD0),
        const Color(0xFF6F6A62),
        const Color(0xFF1A1814),
      ),
    };
  }

  @override
  bool shouldRepaint(covariant _CoverPainter oldDelegate) =>
      oldDelegate.kind != kind;
}
