import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/features/cart/domain/selection_cart.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';
import 'package:food_doctor/features/materials/data/material_catalog.dart';
import 'package:food_doctor/features/materials/domain/material_item.dart';
import 'package:go_router/go_router.dart';

class MaterialDetailScreen extends StatefulWidget {
  const MaterialDetailScreen({
    super.key,
    required this.typeId,
    required this.itemId,
  });

  final String typeId;
  final String itemId;

  @override
  State<MaterialDetailScreen> createState() => _MaterialDetailScreenState();
}

class _MaterialDetailScreenState extends State<MaterialDetailScreen> {
  final _note = TextEditingController();
  var _error = '';

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = MaterialCatalog.itemById(widget.typeId, widget.itemId);
    if (item == null) {
      return const FeaturePage(
        title: 'Material',
        showBackButton: true,
        child: EmptyState(
          title: 'Item not found',
          message: 'Go back to the material list.',
        ),
      );
    }
    final text = context.appText;

    return FeaturePage(
      title: item.name,
      subtitle: 'Inquiry',
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          MediaPlaceholder(
            kind: coverForId(widget.typeId),
            label: 'Picture',
          ),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description, style: text.body),
                const SizedBox(height: AppSpacing.md),
                Text('Hot line', style: text.caption),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  item.hotline,
                  style: text.title.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Your question',
            controller: _note,
            hint: 'Pack size, quantity, or what you need to know',
            maxLines: 4,
          ),
          if (_error.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(_error, style: text.caption.copyWith(color: AppColors.danger)),
          ],
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: 'Inquiry',
            onPressed: () => _inquire(item),
          ),
        ],
      ),
    );
  }

  void _inquire(MaterialItem item) {
    final note = _note.text.trim();
    if (note.isEmpty) {
      setState(() => _error = 'Write the question you want to send.');
      return;
    }
    setState(() => _error = '');
    final line = InquiryLine(id: item.id, title: item.name, note: note);
    showAppDialog(
      context: context,
      title: 'Inquiry',
      message: 'Check out this inquiry, or add more materials first.',
      primaryLabel: 'Check out',
      onPrimary: () {
        CartScope.of(context).addInquiry(line);
        context.push(AppRoutes.inquiry);
      },
      secondaryLabel: 'Inquiry more',
      onSecondary: () {
        CartScope.of(context).addInquiry(line);
        context.go(AppRoutes.materials);
      },
    );
  }
}
