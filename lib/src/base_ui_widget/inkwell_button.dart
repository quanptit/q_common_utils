import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final bool isAddInkWellOnTop;

  const InkWellButton({super.key, this.onTap, required this.child, this.borderRadius, this.isAddInkWellOnTop = false});

  @override
  Widget build(BuildContext context) {
    if (isAddInkWellOnTop) {
      return Stack(
        alignment: Alignment.center,        
        children: [
          child,
          if(onTap != null)
            Positioned.fill(
              child: Material(
                borderRadius: borderRadius,
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: borderRadius,
                  onTap: onTap,
                ),
              ),
            ),
        ],
      );
    }

    return Material(
      borderRadius: borderRadius,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
