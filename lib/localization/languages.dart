import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nConnection.",
          'general_exception':
              "we're unable to process your request.\n Please try again.",
          'welcome_back': "Welcome\nBack",
          'login': 'Login',
          'email_hint': 'Email',
          'password_hint': 'Password'
        },
        'bn_BD': {'email_hint': 'ইমেইল লিখুন'}
      };
}
