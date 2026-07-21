import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowColumnButton extends StatelessWidget {
  final List<Widget> children;
  final bool isRow;
  final double space;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool reverseOrder;

  /// Creates a responsive Row/Column layout with spacing.
  ///
  /// - Removes `SizedBox` elements from [children]
  /// - If [reverseOrder] is true, the order of widgets is reversed
  /// - Automatically adds spacing between elements
  const RowColumnButton({
    super.key,
    required this.children,
    this.isRow = true,
    this.space = 15.0,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.reverseOrder = false,
  });

  @override
  Widget build(BuildContext context) {
    // Filter and process children
    List<Widget> newChildren = children.where((w) => !w.toString().startsWith('SizedBox')).toList();

    // Apply reverse order if required
    if (reverseOrder) newChildren = newChildren.reversed.toList();

    // Add spacing between children
    List<Widget> spacedChildren = [];
    for (int i = 0; i < newChildren.length; i++) {
      final child = newChildren[i];
      if (isRow) {
        spacedChildren.add(Expanded(child: child));
        if (i != newChildren.length - 1) {
          spacedChildren.add(SizedBox(width: space));
        }
      } else {
        spacedChildren.add(child);
        if (i != newChildren.length - 1) {
          spacedChildren.add(SizedBox(height: space));
        }
      }
    }

    // Return Row or Column
    return isRow
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: spacedChildren,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
            children: spacedChildren,
          );
  }
}
