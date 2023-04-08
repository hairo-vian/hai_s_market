abstract class ApiContract {
  static const String getCategories = "/products/categories";
  static const String getLatestReleasedProducts = "/products?limit=10&skip=90";
  static const String getAllProducts = "/products/search";
  static const String getProductsByCategory = "/products/category";
}
