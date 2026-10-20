import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/features/blog/data/blog_catalog.dart';
import 'package:food_doctor/features/experts/data/expert_catalog.dart';
import 'package:go_router/go_router.dart';

class ExpertDetailScreen extends StatefulWidget {
  const ExpertDetailScreen({super.key, required this.expertId});

  final String expertId;

  @override
  State<ExpertDetailScreen> createState() => _ExpertDetailScreenState();
}

class _ExpertDetailScreenState extends State<ExpertDetailScreen> {
  final _note = TextEditingController();
  var _error = '';

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expert = ExpertCatalog.byId(widget.expertId);
    if (expert == null) {
      return const FeaturePage(
        title: 'Expert',
        showBackButton: true,
        child: EmptyState(
          title: 'Profile not found',
          message: 'Go back to the expert list.',
        ),
      );
    }
    final text = context.appText;
    return FeaturePage(
      title: expert.name,
      subtitle: expert.role,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          const MediaPlaceholder(icon: Icons.person_outline, label: 'Photo'),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expert.description, style: text.body),
                const SizedBox(height: AppSpacing.md),
                Text('Telephone  ${expert.phone}', style: text.body),
                Text('Email  ${expert.email}', style: text.body),
                Text('Social  ${expert.social}', style: text.body),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Articles',
            style: text.title.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final articleId in expert.articleIds) ...[
            if (BlogCatalog.byId(articleId) case final article?)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: DirectoryTile(
                  title: article.title,
                  subtitle: article.tag,
                  cover: coverForId(article.id),
                  onTap: () => context.push(AppRoutes.blogPost(article.id)),
                ),
              ),
          ],
          const SizedBox(height: AppSpacing.md),
          Text(
            'Inquiry',
            style: text.title.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            label: 'Your question',
            controller: _note,
            hint: 'What do you want to ask?',
            maxLines: 4,
          ),
          if (_error.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(_error, style: text.caption.copyWith(color: AppColors.danger)),
          ],
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: 'Send inquiry',
            onPressed: () {
              if (_note.text.trim().isEmpty) {
                setState(() => _error = 'Write the question first.');
                return;
              }
              setState(() => _error = '');
              showAppDialog(
                context: context,
                title: 'Inquiry sent',
                message:
                    'Your question for ${expert.name} was sent to the administrator.',
                primaryLabel: 'Close',
              );
            },
          ),
        ],
      ),
    );
  }
}
