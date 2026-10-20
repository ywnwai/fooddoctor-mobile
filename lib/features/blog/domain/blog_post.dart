enum BlogGroup { update, featured }

enum BlogMedia { photo, video, pdf }

class BlogPost {
  const BlogPost({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.tag,
    required this.group,
    required this.media,
  });

  final String id;
  final String title;
  final String summary;
  final String body;
  final String tag;
  final BlogGroup group;
  final BlogMedia media;
}
