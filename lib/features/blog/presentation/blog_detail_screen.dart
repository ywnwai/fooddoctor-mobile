import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/info_chip.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/core/widgets/secondary_button.dart';
import 'package:food_doctor/features/blog/data/blog_catalog.dart';
import 'package:food_doctor/features/blog/domain/blog_post.dart';
import 'package:go_router/go_router.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key, required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context) {
    final post = BlogCatalog.byId(postId);
    if (post == null) {
      return const FeaturePage(
        title: 'Blog',
        showBackButton: true,
        child: EmptyState(
          title: 'Article not found',
          message: 'Go back to the blog list.',
        ),
      );
    }
    final text = context.appText;
    final previous = BlogCatalog.previousOf(post);
    final next = BlogCatalog.nextOf(post);
    final kind = switch (post.media) {
      BlogMedia.video => CoverKind.video,
      BlogMedia.pdf => CoverKind.document,
      BlogMedia.photo => coverForId(post.id),
    };

    return FeaturePage(
      title: post.title,
      subtitle: post.tag,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          MediaPlaceholder(kind: kind, label: post.media.name),
          const SizedBox(height: AppSpacing.md),
          InfoChip(label: post.tag),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Text(post.body, style: text.body.copyWith(height: 1.55)),
          ),
          const SizedBox(height: AppSpacing.lg),
          SecondaryButton(
            label: 'Back to listing',
            onPressed: () => context.go(AppRoutes.blog),
          ),
          if (previous != null) ...[
            const SizedBox(height: AppSpacing.xs),
            SecondaryButton(
              label: 'Previous article',
              onPressed: () =>
                  context.pushReplacement(AppRoutes.blogPost(previous.id)),
            ),
          ],
          if (next != null) ...[
            const SizedBox(height: AppSpacing.xs),
            SecondaryButton(
              label: 'Next article',
              onPressed: () =>
                  context.pushReplacement(AppRoutes.blogPost(next.id)),
            ),
          ],
        ],
      ),
    );
  }
}
