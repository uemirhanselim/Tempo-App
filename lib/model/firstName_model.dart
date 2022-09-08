import 'package:azlistview/azlistview.dart';

class FirstName extends ISuspensionBean {
  final String firstName;
  final String tag;

  FirstName({required this.firstName, required this.tag});
  @override
  String getSuspensionTag() => tag;
}
