import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MediumRoundedButton extends StatelessWidget {
  const MediumRoundedButton(
      {Key? key, Color? color, IconData? icon, Color? mailColor})
      : _color = color,
        _icon = icon,
        _mailColor = mailColor,
        super(key: key);

  final Color? _color;
  final IconData? _icon;
  final Color? _mailColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: ProjectBorderRadius.itemCircular(),
      ),
      child: Icon(
        _icon,
        color: _mailColor ?? Colors.white,
      ),
    );
  }
}
