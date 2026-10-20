import 'package:food_doctor/features/blog/domain/blog_post.dart';

abstract final class BlogCatalog {
  static const pageSize = 4;

  static const posts = <BlogPost>[
    BlogPost(
      id: 'cold-chain',
      title: 'Cold-chain notes for sauce producers',
      summary:
          'What to check when a finished sauce waits for a truck in hot weather.',
      body:
          'A sauce that is stable in the kettle can still spoil in a yard. Record the time it leaves the filler, the truck temperature, and the time it is unloaded.\n\nIf the delay is longer than the plant rule, hold the lot and ask quality before it is released.',
      tag: 'Sauces & condiments',
      group: BlogGroup.update,
      media: BlogMedia.photo,
    ),
    BlogPost(
      id: 'label-check',
      title: 'Label checklist before a product leaves the plant',
      summary: 'Name, weight, ingredients, and the lot code, in that order.',
      body:
          'Check the product name against the batch sheet, then the net weight, the ingredient list, and the lot code. A wrong lot code makes a recall impossible to run.\n\nKeep one labeled pack from the lot with the batch record.',
      tag: 'Bakery & confectionery',
      group: BlogGroup.update,
      media: BlogMedia.photo,
    ),
    BlogPost(
      id: 'dispatch',
      title: 'Road delays and finished-goods dispatch',
      summary: 'How a snack plant can plan when the road is slow.',
      body:
          'Dispatch only what the truck can deliver inside the plant’s holding time. Split a large order rather than loading product that will sit overnight.\n\nTell the buyer the lot and the expected arrival before the truck leaves.',
      tag: 'Snacks',
      group: BlogGroup.update,
      media: BlogMedia.photo,
    ),
    BlogPost(
      id: 'water-log',
      title: 'Water quality log for beverage lines',
      summary: 'A daily note that belongs next to the filler, not in a drawer.',
      body:
          'Write the source, the treatment step, and the result of the day’s check. If the result is outside the limit, stop filling and record who was told.\n\nThe log is part of the batch, even when the product itself looks clear.',
      tag: 'Beverages',
      group: BlogGroup.update,
      media: BlogMedia.photo,
    ),
    BlogPost(
      id: 'allergen',
      title: 'Allergen note on snack packaging',
      summary: 'Say what is in the recipe and what is handled on the same line.',
      body:
          'List allergens in the recipe, then allergens from a shared fryer or packing line. Do not hide them in a general ingredient sentence.\n\nIf the line changes, change the label before the next lot is packed.',
      tag: 'Snacks',
      group: BlogGroup.update,
      media: BlogMedia.photo,
    ),
    BlogPost(
      id: 'gmp-walk',
      title: 'A small-plant GMP walk-through',
      summary: 'A featured video for a dairy room with one shift.',
      body:
          'Start at the changing room, then the process, then the cold store. Look for hands, tools, and product left without a cover.\n\nWrite the findings the same day and name the person who will close each one.',
      tag: 'Dairy',
      group: BlogGroup.featured,
      media: BlogMedia.video,
    ),
    BlogPost(
      id: 'gov-notice',
      title: 'Reading a government food notice',
      summary: 'A featured PDF on how to turn a notice into a plant action.',
      body:
          'Mark the date, the products it covers, and the deadline. Then list the records you already have and the ones you still need.\n\nShare that list with production and quality before the deadline, not after a buyer asks.',
      tag: 'Beverages',
      group: BlogGroup.featured,
      media: BlogMedia.pdf,
    ),
  ];

  static List<BlogPost> byGroup(BlogGroup group) {
    return posts.where((post) => post.group == group).toList();
  }

  static BlogPost? byId(String id) {
    for (final post in posts) {
      if (post.id == id) {
        return post;
      }
    }
    return null;
  }

  static BlogPost? previousOf(BlogPost post) {
    final index = posts.indexWhere((item) => item.id == post.id);
    if (index <= 0) {
      return null;
    }
    return posts[index - 1];
  }

  static BlogPost? nextOf(BlogPost post) {
    final index = posts.indexWhere((item) => item.id == post.id);
    if (index < 0 || index >= posts.length - 1) {
      return null;
    }
    return posts[index + 1];
  }
}
