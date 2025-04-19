import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_date.dart';
import 'shahanshahi_formatter.dart';

part 'shahanshahi_calculation.dart';

class Shahanshahi extends Date {
  static const Shahanshahi min = Shahanshahi._raw(1925675, 1119, 1, 1, 0, 0, 0, 0, true);
  static const Shahanshahi max = Shahanshahi._raw(3108616, 4357, 10, 11, 23, 59, 59, 999, false);

  const Shahanshahi._raw(
      this.julianDayNumber,
      this.year,
      this.month,
      this.day,
      this.hour,
      this.minute,
      this.second,
      this.millisecond,
      this._isLeap,
      );

  @override
  final int julianDayNumber;
  @override
  final int year;
  @override
  final int month;
  @override
  final int day;
  @override
  final int hour;
  @override
  final int minute;
  @override
  final int second;
  @override
  final int millisecond;
  final bool _isLeap;

  @override
  int get weekDay => (julianDayNumber + 2) % 7 + 1;

  @override
  int get monthLength => month <= 6 ? 31 : (month <= 11 ? 30 : (_isLeap ? 30 : 29));

  @override
  ShahanshahiFormatter get formatter => ShahanshahiFormatter(this);

  factory Shahanshahi(
      final int year, [
        final int month = 1,
        final int day = 1,
        final int hour = 0,
        final int minute = 0,
        final int second = 0,
        final int millisecond = 0,
      ]) {
    return _Algo.createFromYearMonthDay(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  factory Shahanshahi.fromJulianDayNumber(
      final int julianDayNumber, [
        final int hour = 0,
        final int minute = 0,
        final int second = 0,
        final int millisecond = 0,
      ]) {
    final jalali = _Algo.createFromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
    return Shahanshahi(
      jalali.year + 1180,
      jalali.month,
      jalali.day,
      jalali.hour,
      jalali.minute,
      jalali.second,
      jalali.millisecond,
    );
  }

  factory Shahanshahi.fromDateTime(DateTime dateTime) {
    return Gregorian.fromDateTime(dateTime).toJalali().toShahanshahi();
  }

  factory Shahanshahi.now() {
    return Gregorian.now().toShahanshahi();
  }

  @override
  Shahanshahi copy({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
  }) {
    return Shahanshahi(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
    );
  }

  @override
  DateTime toDateTime() => toJalali().toGregorian().toDateTime();

  @override
  DateTime toUtcDateTime() => toJalali().toGregorian().toUtcDateTime();

  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  Jalali toJalali() {
    return Jalali(
      year - 1180,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  @override
  bool isLeapYear() => _isLeap;

  @override
  String toString() => 'Shahanshahi($year, $month, $day, $hour, $minute, $second, $millisecond)';

  @override
  Shahanshahi operator +(int days) => addDays(days);
  @override
  Shahanshahi operator -(int days) => addDays(-days);

  @override
  Shahanshahi add({
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
  }) {
    return Shahanshahi(
      year + years,
      month + months,
      day + days,
      hour + hours,
      minute + minutes,
      second + seconds,
      millisecond + milliseconds,
    );
  }

  @override
  Shahanshahi addYears(int years) => Shahanshahi(year + years, month, day, hour, minute, second, millisecond);

  @override
  Shahanshahi addMonths(int months) {
    final int sum = month + months - 1;
    final int mod = sum % 12;
    final int deltaYear = (sum - mod) ~/ 12;
    return Shahanshahi(
      year + deltaYear,
      mod + 1,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  @override
  Shahanshahi addDays(int days) {
    return Shahanshahi.fromJulianDayNumber(
      julianDayNumber + days,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  @override
  Shahanshahi withYear(int year) => Shahanshahi(year, month, day, hour, minute, second, millisecond);
  @override
  Shahanshahi withMonth(int month) => Shahanshahi(year, month, day, hour, minute, second, millisecond);
  @override
  Shahanshahi withDay(int day) => Shahanshahi(year, month, day, hour, minute, second, millisecond);

  String toDisplay() => '${formatter.wN} - $day ${formatter.mN} $year';
}

extension _JalaliToShahanshahi on Jalali {
  Shahanshahi toShahanshahi() => Shahanshahi(
    year + 1180,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
  );
}
