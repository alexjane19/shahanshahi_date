import 'package:shahanshahi_date/l10n/localization.dart';
import 'package:shahanshahi_date/l10n/message.dart';

import '../date_formatter.dart';
import 'shahanshahi_date.dart';

/// Shahanshahi date formatter class
class ShahanshahiFormatter extends DateFormatter {
  /// make a [ShahanshahiFormatter] from [Shahanshahi] date
  const ShahanshahiFormatter(Shahanshahi date) : super(date);

  /// Shahanshahi month names
  static const List<String> _monthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'آمرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  /// Shahanshahi Month Names in Afghanistan
  static const List<String> _monthNamesAfghanistan = [
    'حمل',
    'ثور',
    'جوزا',
    'سرطان',
    'اسد',
    'سنبله',
    'میزان',
    'عقرب',
    'قوس',
    'جدی',
    'دلو',
    'حوت',
  ];

  /// Shahanshahi week day names
  static const List<String> _weekDayNames = [
    'شنبه',
    'یک شنبه',
    'دو شنبه',
    'سه شنبه',
    'چهار شنبه',
    'پنج شنبه',
    'جمعه',
  ];

  /// Shahanshahi month name
  @override
  String get mN {
    return LocalizationMessages.month(date.month);
  }

  /// Shahanshahi month name in Afghanistan
  String get mNAf {
    return LocalizationMessages.month(date.month, type: MessageType.afghanistan);
  }

  /// Shahanshahi week day name
  @override
  String get wN {
    return LocalizationMessages.weekday(date.weekDay);
  }
}
