class ApiEndPoints {
  static const String baseUrl = 'https://dushkaburger.com/wp-json/';

  // Guest Cart
  static const String getGuestId = 'guestcart/v1/guestid';
  static const String getCart = 'guestcart/v1/cart';
  static const String addToCart = 'guestcart/v1/cart';
  static const String deleteFromCart = 'guestcart/v1/cart';

  // Categories
  static const String getCategories = 'custom-api/v1/categories';

  // Products
  static const String getProductDetails = 'custom-api/v1/products';
  static const String getProductAddons = 'proaddon/v1/get2/';
}


