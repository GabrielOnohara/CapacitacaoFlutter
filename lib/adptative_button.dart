
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {

  final String label;
  final Function onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textTheme.button.color,
          child: Text(label),
          onPressed: onPressed,
        );
  }
}
