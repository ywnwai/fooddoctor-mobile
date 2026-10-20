import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/status_badge.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.statusLabel,
    this.onTap,
  });

  final String name;
  final String role;
  final String statusLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Semantics(
      button: onTap != null,
      label: '$name, $role, $statusLabel',
      child: ContentCard(
        onTap: onTap,
        child: ExcludeSemantics(
          child: Row(
            children: [
              _InitialAvatar(name: name),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.title.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      role,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text.caption.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              StatusBadge(label: statusLabel),
            ],
          ),
        ),
      ),
    );
  }
}

class _InitialAvatar extends StatelessWidget {
  const _InitialAvatar({required this.name});

  final String name;

  String get _initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) {
      return 'FD';
    }
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gold, Color(0xFFC9960A)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.28),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        _initials,
        style: context.appText.title.copyWith(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}
