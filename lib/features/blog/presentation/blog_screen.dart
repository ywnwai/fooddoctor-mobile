import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_tab_bar.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/info_chip.dart';
import 'package:food_doctor/features/blog/data/blog_catalog.dart';
import 'package:food_doctor/features/blog/domain/blog_post.dart';
import 'package:go_router/go_router.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  var _tab = 0;
  var _page = 0;

  CoverKind _coverFor(BlogPost post) {
    if (post.media == BlogMedia.video) return CoverKind.video;
    if (post.media == BlogMedia.pdf) return CoverKind.document;
    return coverForId(post.id);
  }

  @override
  Widget build(BuildContext context) {
    final group = _tab == 0 ? BlogGroup.update : BlogGroup.featured;
    final posts = BlogCatalog.byGroup(group);
    final pageCount = (posts.length / BlogCatalog.pageSize).ceil().clamp(1, 99);
    final page = _page.clamp(0, pageCount - 1);
    final start = page * BlogCatalog.pageSize;
    final visible = posts.skip(start).take(BlogCatalog.pageSize).toList();
    final text = context.appText;
    final l10n = context.l10n;

    return FeaturePage(
      title: l10n.blog,
      subtitle: l10n.blogSubtitle,
      showBackButton: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.sm,
              AppSpacing.page,
              0,
            ),
            child: AppTabBar(
              tabs: [l10n.updates, l10n.featured],
              index: _tab,
              onChanged: (index) => setState(() {
                _tab = index;
                _page = 0;
              }),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.md,
                AppSpacing.page,
                AppSpacing.lg,
              ),
              children: [
                for (final post in visible) ...[
                  ContentCard(
                    onTap: () => context.push(AppRoutes.blogPost(post.id)),
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CoverArt(
                          kind: _coverFor(post),
                          height: _tab == 1 ? 168 : 128,
                          radius: 0,
                          showPlay: post.media == BlogMedia.video,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoChip(label: post.tag),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                post.title,
                                style: text.title.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xxs),
                              Text(
                                post.summary,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: text.body.copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
                if (pageCount > 1) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: page == 0
                            ? null
                            : () => setState(() => _page = page - 1),
                        child: const Text('Previous'),
                      ),
                      Text(
                        'Page ${page + 1} of $pageCount',
                        style: context.appText.caption.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      TextButton(
                        onPressed: page >= pageCount - 1
                            ? null
                            : () => setState(() => _page = page + 1),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
