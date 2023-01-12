// ignore_for_file: no_leading_underscores_for_library_prefixes, must_be_immutable
import 'package:flutter/material.dart';

class BarChartCustom extends StatefulWidget {
  const BarChartCustom(
      {Key? key,
      this.max,
      required this.listData,
      this.verticalDirection,
      this.domainLineStyle,
      this.measureLineStyle,
      this.showDomainLine,
      this.showMeasureLine,
      this.spaceBetweenItem,
      this.labelAlign,
      this.domainLabelStyle,
      this.measureLabelStyle,
      this.showValueLabel,
      this.showDomainLabel,
      this.showMeasureLabel,
      this.spaceDomainLabeltoChart,
      this.spaceMeasureLabeltoChart,
      this.showLoading,
      this.loadingDuration,
      this.labelPadding,
      this.radiusBar,
      this.spaceDomainLinetoChart,
      this.spaceMeasureLinetoChart,
      this.showDomainLabelInside,
      this.columnConstrain,
      this.gap,
      this.backgroundColor})
      : super(key: key);

  final double? max;
  final List<BarDataCustom> listData;
  final double? gap;
  final bool? verticalDirection;
  final BorderSide? domainLineStyle;
  final BorderSide? measureLineStyle;
  final bool? showDomainLine;
  final bool? showMeasureLine;
  final TextStyle? domainLabelStyle;
  final TextStyle? measureLabelStyle;
  final bool? showDomainLabel;
  final bool? showDomainLabelInside;
  final bool? showMeasureLabel;
  final bool? showValueLabel;
  final double? spaceBetweenItem;
  final double? spaceDomainLabeltoChart;
  final double? spaceMeasureLabeltoChart;
  final double? spaceDomainLinetoChart;
  final double? spaceMeasureLinetoChart;
  final Alignment? labelAlign;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? labelPadding;
  final bool? showLoading;
  final Duration? loadingDuration;
  final BorderRadius? radiusBar;
  final BoxConstraints? columnConstrain;

  @override
  State<BarChartCustom> createState() => _BarCustomState();
}

class _BarCustomState extends State<BarChartCustom> {
  double max = 1;
  bool loading = false;

  @override
  void initState() {
    if (widget.showLoading ?? false) {
      setState(() {
        loading = true;
      });
      Future.delayed(
        widget.loadingDuration ?? const Duration(milliseconds: 1200),
        () {
          setState(() {
            loading = false;
          });
        },
      );
    }

    List list = widget.listData.map((e) => e).toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    max = widget.max ?? list.last.value;

    super.initState();
  }

  Widget minLabel() {
    return Text(
      _numberAutoDigit(0),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  Widget maxLabel() {
    return Text(
      _numberAutoDigit(max),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  BorderSide domainLine() {
    return (widget.showDomainLine ?? false)
        ? widget.domainLineStyle != null
            ? widget.domainLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  BorderSide measureLine() {
    return (widget.showMeasureLine ?? false)
        ? widget.measureLineStyle != null
            ? widget.measureLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  EdgeInsetsGeometry paddingChart() {
    return EdgeInsets.only(
      bottom: (widget.verticalDirection ?? false)
          ? (widget.spaceMeasureLinetoChart ?? 0)
          : (widget.spaceDomainLinetoChart ?? 0),
      left: (widget.verticalDirection ?? false)
          ? (widget.spaceDomainLinetoChart ?? 0)
          : (widget.spaceMeasureLinetoChart ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(builder: (context, constraintsOut) {
      // if (widget.verticalDirection ?? false) {
      //   // vertical
      //   return Row(
      //     children: [
      //       if (widget.showDomainLabel ?? false)
      //         Padding(
      //           padding: EdgeInsets.only(
      //             bottom: widget.spaceMeasureLinetoChart ?? 0,
      //           ),
      //           child: LayoutBuilder(
      //               builder: (context, constrainsDomainLabelHorz) {
      //             return Column(
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: List.generate(widget.listData.length, (index) {
      //                 BarDataCustom item = widget.listData[index];
      //                 return Container(
      //                   alignment: Alignment.center,
      //                   height: (constrainsDomainLabelHorz.maxHeight /
      //                           widget.listData.length) -
      //                       (widget.spaceBetweenItem ??
      //                           ((constrainsDomainLabelHorz.maxHeight /
      //                                   widget.listData.length) *
      //                               0.1)),
      //                   child: item.labelCustom ??
      //                       Text(
      //                         item.label,
      //                         style: widget.domainLabelStyle,
      //                         maxLines: 1,
      //                         overflow: TextOverflow.ellipsis,
      //                       ),
      //                 );
      //               }),
      //             );
      //           }),
      //         ),
      //       SizedBox(width: widget.spaceDomainLabeltoChart ?? 5),
      //       Expanded(
      //         child: Stack(
      //           children: [
      //             Container(
      //               // height: constraintsOut.maxHeight,
      //               decoration: BoxDecoration(
      //                 border: Border(
      //                   bottom: measureLine(),
      //                   left: domainLine(),
      //                 ),
      //               ),
      //               child: Padding(
      //                 padding: paddingChart(),
      //                 child:
      //                     LayoutBuilder(builder: (context, constraintsChart) {
      //                   return Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       ...List.generate(
      //                         widget.listData.length,
      //                         (index) {
      //                           BarDataCustom item =
      //                               widget.listData[index];

      //                           return SizedBox(
      //                             width: (item.value / max) *
      //                                 constraintsChart.maxWidth,
      //                             height: (constraintsChart.maxHeight /
      //                                     widget.listData.length) -
      //                                 (widget.spaceBetweenItem ??
      //                                     ((constraintsChart.maxHeight /
      //                                             widget.listData.length) *
      //                                         0.1)),
      //                             child: _BarItemValueView(
      //                               barDataCustom: item,
      //                               labelPadding: widget.labelPadding,
      //                               labelAlign: widget.labelAlign,
      //                               radiusBar: widget.radiusBar,
      //                               verticalOffsetTooltip: 0,
      //                             ),
      //                           );
      //                         },
      //                       ),
      //                     ],
      //                   );
      //                 }),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.bottomLeft,
      //               child: Transform.translate(
      //                 offset: Offset(
      //                   0 +
      //                       (widget.spaceDomainLinetoChart ?? 0) +
      //                       ((widget.showMeasureLine ?? false)
      //                           ? (widget.measureLineStyle == null
      //                               ? 0
      //                               : widget.measureLineStyle!.width)
      //                           : 0),
      //                   12 +
      //                       ((widget.showMeasureLine ?? false)
      //                           ? (widget.measureLineStyle == null
      //                               ? 0
      //                               : widget.measureLineStyle!.width)
      //                           : 0) +
      //                       (widget.spaceMeasureLabeltoChart ?? 5),
      //                 ),
      //                 child: minLabel(),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.bottomRight,
      //               child: Transform.translate(
      //                   offset: Offset(
      //                     0,
      //                     12 +
      //                         ((widget.showMeasureLine ?? false)
      //                             ? (widget.measureLineStyle == null
      //                                 ? 0
      //                                 : widget.measureLineStyle!.width)
      //                             : 0) +
      //                         (widget.spaceMeasureLabeltoChart ?? 5),
      //                   ),
      //                   child: maxLabel()),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   );
      // }

      // horizontal
      return Row(
        children: [
          if (widget.showMeasureLabel ?? false)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.translate(
                  offset: const Offset(0, -4),
                  child: maxLabel(),
                ),
                Transform.translate(
                  offset: Offset(
                    0,
                    4 -
                        ((widget.showDomainLine ?? false)
                            ? (widget.domainLineStyle == null
                                ? 0
                                : widget.domainLineStyle!.width)
                            : 0) -
                        (widget.spaceDomainLinetoChart ?? 0),
                  ),
                  child: minLabel(),
                ),
              ],
            ),
          SizedBox(width: widget.spaceMeasureLabeltoChart ?? 5),
          Expanded(
            child: Container(
              height: constraintsOut.maxHeight,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                border: Border(
                  bottom: domainLine(),
                  left: measureLine(),
                ),
              ),
              child: Padding(
                padding: paddingChart(),
                child: LayoutBuilder(builder: (context, constraintsChart) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          widget.listData.length,
                          (index) {
                            BarDataCustom item = widget.listData[index];
                            return Padding(
                              padding: EdgeInsets.only(right: widget.gap ?? 10),
                              child: ConstrainedBox(
                                constraints: widget.columnConstrain ??
                                    const BoxConstraints(
                                        minHeight: 100, minWidth: 100),
                                child: SizedBox(
                                  height: (item.value.abs() / max) *
                                      constraintsChart.maxHeight,
                                  width: (constraintsChart.maxWidth /
                                          widget.listData.length) -
                                      (widget.spaceBetweenItem ??
                                          ((constraintsChart.maxWidth /
                                                  widget.listData.length) *
                                              0.1)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Stack(
                                      children: [
                                        if (widget.showValueLabel ?? false)
                                          Transform.translate(
                                            offset: const Offset(0, -20),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: item.valueCustom ??
                                                  Text(
                                                    _numberAutoDigit(
                                                        item.value),
                                                    style: item.valueStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                            ),
                                          ),
                                        _BarItemValueView(
                                          showDomainLabelInside:
                                              widget.showDomainLabelInside,
                                          barDataCustom: item,
                                          labelPadding: widget.labelPadding,
                                          labelAlign: widget.labelAlign,
                                          radiusBar: widget.radiusBar,
                                          verticalOffsetTooltip:
                                              (((item.value / max) *
                                                          constraintsChart
                                                              .maxHeight) *
                                                      0.5) +
                                                  4,
                                        ),
                                        if (widget.showDomainLabel ?? false)
                                          Transform.translate(
                                            offset: Offset(
                                              0,
                                              15 +
                                                  (widget.spaceDomainLabeltoChart ??
                                                      5) +
                                                  ((widget.showDomainLine ??
                                                          false)
                                                      ? (widget.domainLineStyle ==
                                                              null
                                                          ? 0
                                                          : widget
                                                              .domainLineStyle!
                                                              .width)
                                                      : 0) +
                                                  (widget.spaceDomainLinetoChart ??
                                                      0),
                                            ),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: item.labelCustom ??
                                                  Text(
                                                    item.label,
                                                    style:
                                                        widget.domainLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class BarDataCustom {
  final Color? color;
  final Color? splashColor;
  final double value;
  final String? valueTooltip;
  final String label;
  final TextStyle? valueStyle;
  final TextStyle? domainStyle;
  final Widget? labelCustom;
  final Widget? valueCustom;

  final double? elevation;
  final Color? shadowColor;
  final Function? onTap;

  BarDataCustom({
    this.color,
    required this.value,
    required this.label,
    this.valueStyle,
    this.valueTooltip,
    this.labelCustom,
    this.valueCustom,
    this.domainStyle,
    this.onTap,
    this.elevation,
    this.splashColor,
    this.shadowColor,
  });
}

class _BarItemValueView extends StatelessWidget {
  const _BarItemValueView({
    Key? key,
    this.labelAlign,
    required this.verticalOffsetTooltip,
    required this.barDataCustom,
    this.labelPadding,
    this.radiusBar,
    this.showDomainLabelInside,
  }) : super(key: key);

  final BarDataCustom barDataCustom;
  final Alignment? labelAlign;
  final EdgeInsetsGeometry? labelPadding;
  final double verticalOffsetTooltip;
  final bool? showDomainLabelInside;
  final BorderRadius? radiusBar;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: barDataCustom.valueTooltip ??
          '${barDataCustom.label}: ${_numberAutoDigit(barDataCustom.value)}',
      preferBelow: false,
      verticalOffset: verticalOffsetTooltip,
      child: GestureDetector(
        onTap:
            barDataCustom.onTap == null ? null : () => barDataCustom.onTap!(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Material(
              elevation: barDataCustom.elevation ?? 0,
              borderRadius: radiusBar,
              shadowColor: barDataCustom.shadowColor,
              color: barDataCustom.color ?? Colors.blue[100],
              child: InkWell(
                borderRadius: radiusBar,
                splashColor: barDataCustom.splashColor,
                onTap: barDataCustom.onTap == null
                    ? null
                    : () => barDataCustom.onTap!(),
                child: const SizedBox(),
              ),
            ),
            if (showDomainLabelInside ?? false)
              barDataCustom.labelCustom ??
                  Align(
                    alignment: labelAlign ?? Alignment.topCenter,
                    child: Padding(
                      padding: labelPadding ?? const EdgeInsets.all(4),
                      child: Text(
                        barDataCustom.label,
                        style: barDataCustom.domainStyle,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

String _numberAutoDigit(double value, [int maxDigit = 3]) {
  if (value.toInt() == value) {
    return value.toInt().toString();
  } else {
    int digit = value.toString().split('.').last.length;
    if (digit > maxDigit) return value.toStringAsFixed(maxDigit);
    return value.toString();
  }
}
