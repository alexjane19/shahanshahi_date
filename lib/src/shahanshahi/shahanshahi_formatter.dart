import 'package:shahanshahi_date/l10n/localization.dart';
import 'package:shahanshahi_date/l10n/message.dart';

import '../date_formatter.dart';
import 'shahanshahi_date.dart';

/// Shahanshahi date formatter class
class ShahanshahiFormatter extends DateFormatter {
  /// make a [ShahanshahiFormatter] from [Shahanshahi] date
  const ShahanshahiFormatter(Shahanshahi date) : super(date);

  /// Shahanshahi month name
  @override
  String get mN {
    return LocalizationMessages.month(date.month);
  }

  /// Shahanshahi month name in Afghanistan
  String get mNAf {
    return monthName(type: MessageType.afghanistan);
  }

  /// Shahanshahi week day name
  @override
  String get wN {
    return LocalizationMessages.weekday(date.weekDay);
  }

  /// Shahanshahi month name with optional explicit locale and message type.
  String monthName({Locale? locale, MessageType? type}) {
    return LocalizationMessages.month(
      date.month,
      locale: locale,
      type: type,
    );
  }

  /// Shahanshahi weekday name with optional explicit locale and message type.
  String weekDayName({Locale? locale, MessageType? type}) {
    return LocalizationMessages.weekday(
      date.weekDay,
      locale: locale,
      type: type,
    );
  }
}
