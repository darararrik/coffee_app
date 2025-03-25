import 'package:coffee_app/core/presentation/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget plusIcon = SvgPicture.asset(
  "assets/svg/icons/plus.svg",
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
);

Widget minusIcon = SvgPicture.asset(
  "assets/svg/icons/minus.svg",
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
);

Widget backButtonIcon = SvgPicture.asset(
  "assets/svg/icons/arrow_back.svg",
  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
);
Widget trashIcon = SvgPicture.asset(
  "assets/svg/icons/trash.svg",
  width: 32,
  height: 32,
  colorFilter: const ColorFilter.mode(neutral3LightDarkColor, BlendMode.srcIn),
);
Widget placeholderCoffee = SvgPicture.asset(
  "assets/svg/icons/placeholderCoffee.svg",
  colorFilter: const ColorFilter.mode(neutral3LightDarkColor, BlendMode.srcIn),
);
