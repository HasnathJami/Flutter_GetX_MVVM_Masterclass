import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'email_hint': 'Enter email'},
        'bn_BD': {'email_hint': 'ইমেইল লিখুন'}
      };
}
