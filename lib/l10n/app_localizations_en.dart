// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get retry => 'Retry';

  @override
  String get gallery => 'Gallery';

  @override
  String get gallery_error => 'Error occurred while loading gallery';

  @override
  String get comments => 'Comments';

  @override
  String get comments_error => 'Error occurred while loading comments';

  @override
  String comments_name(Object name) {
    return 'Name: $name';
  }

  @override
  String comments_email(Object email) {
    return 'Email: $email';
  }

  @override
  String get network_error => 'Network error';
}
