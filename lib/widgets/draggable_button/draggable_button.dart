// ignore_for_file: deprecated_colon_for_default_value, library_private_types_in_public_api, constant_identifier_names

library draggable_fab;

import 'dart:math';

import 'package:flutter/material.dart';

/// Draggable FAB widget which is always aligned to
/// the edge of the screen - be it left,top, right,bottom
class DraggableButton extends StatefulWidget {
  final Widget child;
  final Offset? initPosition;
  final double securityBottom;
  final double securityTop;
  final double securityLeft;
  final double securityRight;

  const DraggableButton(
      {Key? key,
      required this.child,
      this.initPosition,
      this.securityBottom = 0,
      this.securityTop = 0,
      this.securityLeft = 0,
      this.securityRight = 0})
      : super(key: key);

  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  late Size _widgetSize;
  double? _left, _top;
  double _screenWidth = 0.0, _screenHeight = 0.0;
  double? _screenWidthMid, _screenHeightMid;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getWidgetSize(context));
  }

  void _getWidgetSize(BuildContext context) {
    _widgetSize = context.size!;

    if (widget.initPosition != null) {
      _calculatePosition(widget.initPosition!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: _left,
        top: _top,
        child: Draggable(
          feedback: widget.child,
          onDragEnd: _handleDragEnded,
          childWhenDragging: const SizedBox(
            width: 0.0,
            height: 0.0,
          ),
          child: widget.child,
        ),
      )
    ]);
  }

  void _handleDragEnded(DraggableDetails draggableDetails) {
    _calculatePosition(draggableDetails.offset);
  }

  void _calculatePosition(Offset targetOffset) {
    if (_screenWidthMid == null || _screenHeightMid == null) {
      Size screenSize = MediaQuery.of(context).size;
      _screenWidth = screenSize.width;
      _screenHeight = screenSize.height;
      _screenWidthMid = _screenWidth / 2;
      _screenHeightMid = _screenHeight / 2;
    }

    switch (_getAnchor(targetOffset)) {
      case Anchor.LEFT_FIRST:
        _left = _widgetSize.width / 2 - 25 + widget.securityLeft;
        _top =
            max(_widgetSize.height / 2, targetOffset.dy + widget.securityTop);
        break;
      case Anchor.TOP_FIRST:
        _left = max(_widgetSize.width / 2, targetOffset.dx);
        _top = _widgetSize.height / 2 + widget.securityTop;
        break;
      case Anchor.RIGHT_SECOND:
        _left = _screenWidth - _widgetSize.width - widget.securityRight;
        _top = max(_widgetSize.height, targetOffset.dy + widget.securityTop);
        break;
      case Anchor.TOP_SECOND:
        _left = min(_screenWidth - _widgetSize.width, targetOffset.dx);
        _top = _widgetSize.height / 2 + widget.securityTop;
        break;
      case Anchor.LEFT_THIRD:
        _left = _widgetSize.width / 2 - 25 + widget.securityLeft;
        _top = min(_screenHeight - _widgetSize.height - widget.securityBottom,
            targetOffset.dy);
        break;
      case Anchor.BOTTOM_THIRD:
        _left = _widgetSize.width / 2;
        _top = _screenHeight - _widgetSize.height - widget.securityBottom;
        break;
      case Anchor.RIGHT_FOURTH:
        _left = _screenWidth - _widgetSize.width - widget.securityRight;
        _top = min(_screenHeight - _widgetSize.height - widget.securityBottom,
            targetOffset.dy);
        break;
      case Anchor.BOTTOM_FOURTH:
        _left = _screenWidth - _widgetSize.width;
        _top = _screenHeight - _widgetSize.height - widget.securityBottom;
        break;
    }
    setState(() {});
  }

  /// Computes the appropriate anchor screen edge for the widget
  Anchor _getAnchor(Offset position) {
    if (position.dx < _screenWidthMid! && position.dy < _screenHeightMid!) {
      return position.dx < position.dy ? Anchor.LEFT_FIRST : Anchor.TOP_FIRST;
    } else if (position.dx >= _screenWidthMid! &&
        position.dy < _screenHeightMid!) {
      return _screenWidth - position.dx < position.dy
          ? Anchor.RIGHT_SECOND
          : Anchor.TOP_SECOND;
    } else if (position.dx < _screenWidthMid! &&
        position.dy >= _screenHeightMid!) {
      return position.dx < _screenHeight - position.dy
          ? Anchor.LEFT_THIRD
          : Anchor.BOTTOM_THIRD;
    } else {
      return _screenWidth - position.dx < _screenHeight - position.dy
          ? Anchor.RIGHT_FOURTH
          : Anchor.BOTTOM_FOURTH;
    }
  }
}

/// #######################################
/// #       |          #        |         #
/// #    TOP_FIRST     #  TOP_SECOND      #
/// # - LEFT_FIRST     #  RIGHT_SECOND -  #
/// #######################################
/// # - LEFT_THIRD     #   RIGHT_FOURTH - #
/// #  BOTTOM_THIRD    #   BOTTOM_FOURTH  #
/// #     |            #       |          #
/// #######################################
enum Anchor {
  LEFT_FIRST,
  TOP_FIRST,
  RIGHT_SECOND,
  TOP_SECOND,
  LEFT_THIRD,
  BOTTOM_THIRD,
  RIGHT_FOURTH,
  BOTTOM_FOURTH
}
