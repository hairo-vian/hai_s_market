abstract class ApiContract {
  static const String getCategories = "/products/categories";
  static const String getLatestReleasedProducts = "/products?limit=10&skip=90";
  static const String getAllProducts = "/products/search";
  static const String getProductsByCategory = "/products/category";

  static const String login = "/api/v1/auth/login";
  static const String getProfile = "/api/v1/auth/profile";
  static const String createUser = "/api/v1/users/";

}
