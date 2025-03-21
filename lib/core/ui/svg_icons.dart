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
