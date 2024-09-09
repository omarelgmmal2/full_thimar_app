import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff4C8613);
const starColor = Color(0xffFF9529);
const greyColor = Color(0xffB1B1B1);
const lightGreyColor = Color(0xff707070);
const buttonReadOpacityColor = Color(0xffFFE1E1);


MaterialColor getMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(color.value, {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color,
  });
}
