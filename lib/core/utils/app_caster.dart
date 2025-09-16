abstract class AppCaster {
  const AppCaster._();

  static String toText(dynamic value, {bool required = false, String defaultValue = ''}) {
    if (value == null) {
      if (required) {
        throw ArgumentError.notNull(value.toString());
      }
      return defaultValue;
    }

    if (value is String) {
      if (value.isEmpty) {
        return defaultValue;
      }
      return value;
    } else if (value is num) {
      return value.toString();
    } else if (value is bool) {
      return value.toString();
    }

    throw ArgumentError('$value cannot be casted to String.');
  }

  static int toInt(dynamic value, {bool required = false}) {
    if (value == null) {
      if (required) {
        throw ArgumentError.notNull(value.toString());
      }
      return 0;
    }

    if (value is String) {
      if (required) {
        return int.parse(value);
      } else {
        return int.tryParse(value) ?? 0;
      }
    } else if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is bool) {
      return value ? 1 : 0;
    }

    throw ArgumentError('$value cannot be casted to Integer.');
  }

  static double toDouble(dynamic value, {bool required = false}) {
    if (value == null) {
      if (required) {
        throw ArgumentError.notNull(value.toString());
      }
      return 0.0;
    }

    if (value is String) {
      if (required) {
        return double.parse(value);
      } else {
        return double.tryParse(value) ?? 0.0;
      }
    } else if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is bool) {
      return value ? 1.0 : 0.0;
    }

    throw ArgumentError('$value cannot be casted to Double.');
  }

  static bool toBool(dynamic value, {bool required = false}) {
    if (value == null) {
      if (required) {
        throw ArgumentError.notNull(value.toString());
      }
      return false;
    }

    if (value is String) {
      if (required) {
        return bool.parse(value);
      } else {
        return bool.tryParse(value) ?? false;
      }
    } else if (value is num) {
      return value == 0 ? false : true;
    } else if (value is bool) {
      return value;
    }

    throw ArgumentError('$value cannot be casted to Double.');
  }

  static DateTime? toDateTime(dynamic value, {bool required = false}) {
    if (value == null || (value is String && value.isEmpty)) {
      if (required) {
        throw ArgumentError.notNull(value.toString());
      }
      return null;
    }
    if (value is String) {
      if (required) {
        return DateTime.parse(value).toLocal();
      } else {
        return DateTime.tryParse(value)?.toLocal();
      }
    } else if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value, isUtc: true).toLocal();
    }

    throw ArgumentError('$value cannot be casted to DateTime.');
  }
}
