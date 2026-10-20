import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/features/industrial/data/supplier_catalog.dart';

class SupplierDetailScreen extends StatelessWidget {
  const SupplierDetailScreen({super.key, required this.supplierId});

  final String supplierId;

  @override
  Widget build(BuildContext context) {
    final supplier = SupplierCatalog.byId(supplierId);
    if (supplier == null) {
      return const FeaturePage(
        title: 'Supplier',
        showBackButton: true,
        child: EmptyState(
          title: 'Supplier not found',
          message: 'Go back to the directory.',
        ),
      );
    }
    final text = context.appText;
    return FeaturePage(
      title: supplier.name,
      subtitle: supplier.phone,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          const MediaPlaceholder(
            icon: Icons.storefront_outlined,
            label: 'Supplier photo',
          ),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(supplier.description, style: text.body),
                const SizedBox(height: AppSpacing.md),
                _Fact(label: 'Telephone', value: supplier.phone),
                _Fact(label: 'Email', value: supplier.email),
                _Fact(label: 'Social', value: supplier.social),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Items from this supplier',
            style: text.title.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final item in supplier.items) ...[
            ContentCard(
              child: Text(item, style: text.body.copyWith(color: text.title.color)),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: text.caption),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            value,
            style: text.body.copyWith(color: text.title.color),
          ),
        ],
      ),
    );
  }
}
