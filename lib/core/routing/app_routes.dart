/// Route paths.
///
/// Tab routes stay inside the bottom navigation shell. The other paths
/// are pushed over the shell so each module can grow its own stack later.
abstract final class AppRoutes {
  static const home = '/home';
  static const catalog = '/catalog';
  static const materials = '/materials';
  static const experts = '/experts';
  static const profile = '/profile';
  static const profileAccount = '/profile/account';
  static const profilePassword = '/profile/password';
  static const profileKnowledge = '/profile/knowledge';
  static const profileInquiries = '/profile/inquiries';

  static const blog = '/blog';
  static const jobs = '/jobs';
  static const industrial = '/industrial';
  static const cart = '/cart';
  static const inquiry = '/inquiry';
  static const notifications = '/notifications';

  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';

  static String catalogCategory(String id) => '/catalog/category/$id';

  static String catalogSize(String categoryId, String sizeId) =>
      '/catalog/category/$categoryId/size/$sizeId';

  static String catalogType(String categoryId, String sizeId, String typeId) =>
      '/catalog/category/$categoryId/size/$sizeId/type/$typeId';

  static String knowledgeItem(String id) => '/knowledge/$id';

  static String blogPost(String id) => '/blog/$id';

  static String materialType(String id) => '/materials/type/$id';

  static String materialItem(String typeId, String itemId) =>
      '/materials/type/$typeId/item/$itemId';

  static String expert(String id) => '/experts/$id';

  static String job(String id) => '/jobs/$id';

  static String supplier(String id) => '/industrial/supplier/$id';
}
