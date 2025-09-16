abstract class AppRoutes {
  static const String loginModule = '/login';
  static const String loginSuffix = '/';
  static const String login = '$loginModule$loginSuffix';

  static const String registerModule = '/register';
  static const String registerSuffix = '/';
  static const String register = '$registerModule$registerSuffix';

  static const String homeModule = '/home';

  static const String customersListSuffix = '/';
  static const String customersList = '$homeModule$customersListSuffix';

  static const String registerCustomerSuffix = '/register';
  static const String registerCustomer = '$homeModule$registerCustomerSuffix';
}
