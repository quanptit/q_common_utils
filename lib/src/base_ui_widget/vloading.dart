import 'package:flutter/material.dart';

class VLoading extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double? sizeProgressIndicator;
  final bool? isNotShowTextLoading;
  final Color? colorProgress;

  const VLoading({
    super.key,
    this.padding = const EdgeInsets.all(3),
    this.sizeProgressIndicator,
    this.isNotShowTextLoading,
    this.colorProgress
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: sizeProgressIndicator ?? 30,
              height: sizeProgressIndicator ?? 30,
              child: CircularProgressIndicator(color: colorProgress),
            ),
            if (isNotShowTextLoading != true)
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text('Loading...'),
              ),
          ],
        ),
      ),
    );
  }
}
