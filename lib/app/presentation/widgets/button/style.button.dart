import 'package:flutter/material.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

final BorderRadius _borderRadiusBtn = BorderRadius.circular(24);

final ButtonStyle buttonStylePrimary = TextButton.styleFrom(
  foregroundColor: Colors.black,
  alignment: Alignment.center,
  backgroundColor: kPrimaryColor,

  // foregroundColor: Colors.grey[350],
  disabledForegroundColor: Colors.grey[350],
  textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
  // disabledBackgroundColor: Color(0xFF33E1EC).withOpacity(0.75),
  // side: BorderSide(color: Color(0xFF33E1EC).withOpacity(0.75)),
  shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
);

final ButtonStyle buttonStyleSecondary = TextButton.styleFrom(
  // alignment: Alignment.center,
  // backgroundColor: celestePet,
  // foregroundColor: Colors.black54,
  // disabledBackgroundColor: celestePet.withOpacity(0.45),
  // disabledForegroundColor: Colors.black38,
  // side: BorderSide(color: celestePet.withOpacity(0.95)),
  // shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
  alignment: Alignment.center,
  foregroundColor: Colors.black54,
  side: BorderSide(color: Colors.black54),
  shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
);

ButtonStyle buttonStyleOther(Color color, Color? textColor) {
  return TextButton.styleFrom(
    alignment: Alignment.center,
    backgroundColor: color,
    foregroundColor: textColor != null ? textColor : Colors.black54,
    disabledBackgroundColor: color.withValues(alpha: 0.45),
    disabledForegroundColor:
        textColor != null ? textColor.withValues(alpha: 0.38) : Colors.black38,
    side: const BorderSide(color: Color(0xFFedede9)),
    shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
  );
}

ButtonStyle buttonStyleIcon(Color color) {
  return TextButton.styleFrom(
    alignment: Alignment.center,
    backgroundColor: color,
    foregroundColor: Colors.black54,
    disabledBackgroundColor: color.withValues(alpha: 0.45),
    disabledForegroundColor: Colors.black38,
    side: BorderSide(color: color.withValues(alpha: 0.95)),
    shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
  );
}
