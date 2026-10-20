import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    required this.index,
    required this.onChanged,
  });

  final List<String> tabs;
  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Row(
      children: [
        for (var tabIndex = 0; tabIndex < tabs.length; tabIndex++)
          Expanded(
            child: InkWell(
              onTap: () => onChanged(tabIndex),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      tabs[tabIndex],
                      textAlign: TextAlign.center,
                      style: text.caption.copyWith(
                        color: tabIndex == index
                            ? AppColors.goldInk
                            : AppColors.textMuted,
                        fontWeight: tabIndex == index
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: tabIndex == index
                        ? AppColors.gold
                        : AppColors.border,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
