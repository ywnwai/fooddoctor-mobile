import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/widgets/module_card.dart';
import 'package:food_doctor/features/home/domain/home_module.dart';
import 'package:food_doctor/features/home/presentation/home_navigation.dart';

/// Two-column module grid. A final odd card sits in the left column.
class HomeModuleGrid extends StatelessWidget {
  const HomeModuleGrid({super.key, required this.modules});

  final List<HomeModule> modules;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var index = 0; index < modules.length; index += 2) {
      final left = modules[index];
      final right = index + 1 < modules.length ? modules[index + 1] : null;
      final isLast = index + 2 >= modules.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.md),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _HomeModuleTile(module: left)),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: right == null
                      ? const SizedBox.shrink()
                      : _HomeModuleTile(module: right),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _HomeModuleTile extends StatelessWidget {
  const _HomeModuleTile({required this.module});

  final HomeModule module;

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      key: ValueKey('module-${module.id.name}'),
      title: module.title,
      subtitle: module.subtitle,
      icon: iconForHomeModule(module.id),
      mark: markForHomeModule(module.id),
      onTap: () => openHomeModule(context, module.id),
    );
  }
}
