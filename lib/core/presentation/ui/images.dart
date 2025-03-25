import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final Widget placeholderCoffeeSvg = SvgPicture.asset(
  'assets/svg/placeholderCoffee.svg',
  // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
  semanticsLabel: 'Red dash paths',
);
final Widget placeholderCoffeePng = Image.asset(
  "assets/img/coffee.png",
  height: 100,
);
