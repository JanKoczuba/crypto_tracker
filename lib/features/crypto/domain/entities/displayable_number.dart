import 'package:intl/intl.dart';

class DisplayableNumber {
  DisplayableNumber({
    required this.value,
    required this.formatted,
  });

  final double value;
  final String formatted;

  bool get isValuePositive => !value.isNegative;
}

extension NumberParsingToDisplayable on double {
  DisplayableNumber formatCurrencyDouble() {
    final formatter =
        NumberFormat.currency(decimalDigits: this > 10 ? 2 : 4, symbol: '\$');
    return DisplayableNumber(
      value: this,
      formatted: formatter.format(this),
    );
  }

  DisplayableNumber formatPercentDouble() {
    final formatter = NumberFormat.decimalPatternDigits(decimalDigits: 2);
    return DisplayableNumber(
      value: this,
      formatted: '${formatter.format(this)}%',
    );
  }
}
