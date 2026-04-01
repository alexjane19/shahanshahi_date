// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:shahanshahi_date/l10n/localization.dart';
import 'package:shahanshahi_date/l10n/message.dart';

import '../date_formatter.dart';
import 'jalali_date.dart';

/// Jalali date formatter class
class JalaliFormatter extends DateFormatter {
  /// make a [JalaliFormatter] from [Jalali] date
  const JalaliFormatter(Jalali date) : super(date);

  /// Jalali month name
  @override
  String get mN {
    return LocalizationMessages.month(date.month);
  }

  /// Jalali month name in Afghanistan
  String get mNAf {
    return monthName(type: MessageType.afghanistan);
  }

  /// Jalali week day name
  @override
  String get wN {
    return LocalizationMessages.weekday(date.weekDay);
  }

  /// Jalali month name with optional explicit locale and message type.
  String monthName({Locale? locale, MessageType? type}) {
    return LocalizationMessages.month(
      date.month,
      locale: locale,
      type: type,
    );
  }

  /// Jalali weekday name with optional explicit locale and message type.
  String weekDayName({Locale? locale, MessageType? type}) {
    return LocalizationMessages.weekday(
      date.weekDay,
      locale: locale,
      type: type,
    );
  }

  /// Jalali short weekday name with optional explicit locale and message type.
  String weekDayShortName({Locale? locale, MessageType? type}) {
    final String weekDayName0 = weekDayName(locale: locale, type: type);
    if (weekDayName0.isEmpty) {
      return weekDayName0;
    }

    return weekDayName0.substring(0, 1).toUpperCase();
  }
}
