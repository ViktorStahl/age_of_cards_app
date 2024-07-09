import 'package:flutter/material.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    super.key,
    required this.label,
    this.height = 36,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Theme.of(context).dividerColor,
              height: height,
            )),
      ),
      Text(label, style: Theme.of(context).textTheme.labelLarge),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Theme.of(context).dividerColor,
              height: height,
            )),
      ),
    ]);
  }
}
