import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';

/// Product cover for detail screens.
///
/// [label] stays for callers; the art itself is the visual, not a caption.
class MediaPlaceholder extends StatelessWidget {
  const MediaPlaceholder({
    super.key,
    this.icon = Icons.image_outlined,
    this.label = 'Photo',
    this.height = 188,
    this.kind,
  });

  final IconData icon;
  final String label;
  final double height;
  final CoverKind? kind;

  @override
  Widget build(BuildContext context) {
    final resolved = kind ?? _kindFor(icon, label);
    return CoverArt(
      kind: resolved,
      height: height,
      radius: AppRadius.xl,
      showPlay: resolved == CoverKind.video || icon == Icons.play_arrow_rounded,
    );
  }

  CoverKind _kindFor(IconData icon, String label) {
    if (icon == Icons.play_arrow_rounded || label == 'Video') {
      return CoverKind.video;
    }
    if (icon == Icons.picture_as_pdf_outlined || label == 'PDF') {
      return CoverKind.document;
    }
    if (icon == Icons.person_outline) return CoverKind.expert;
    if (icon == Icons.storefront_outlined) return CoverKind.supplier;
    return CoverKind.knowledge;
  }
}
