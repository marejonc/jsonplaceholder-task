import 'package:flutter/widgets.dart';
import 'package:tcb_recru_task/l10n/app_localizations.dart';
import 'package:tcb_recru_task/l10n/app_localizations_en.dart';

extension AppLocalizationsUtil on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}
