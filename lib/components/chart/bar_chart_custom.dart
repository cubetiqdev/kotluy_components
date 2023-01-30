// ignore_for_file: no_leading_underscores_for_library_prefixes, must_be_immutable
import 'package:flutter/material.dart';

class BarChartCustom extends StatefulWidget {
  const BarChartCustom(
      {Key? key,
      this.max,
      required this.listData,
      this.xLineStyle,
      this.yLineStyle,
      this.showXLine,
      this.showYLine,
      this.labelAlign,
      this.xLabelStyle,
      this.yLabelStyle,
      this.showValueLabel,
      this.showXLabel,
      this.showYLabel,
      this.spaceXLabeltoChart,
      this.spaceYLabeltoChart,
      this.showLoading,
      this.loadingDuration,
      this.labelPadding,
      this.radiusBar,
      this.spaceXLinetoChart,
      this.spaceYLinetoChart,
      this.showLabelInside,
      this.gap = 10,
      this.backgroundColor,
      this.labelInsideStyle,
      this.valueLabelStyle,
      this.minHeight = 100,
      this.maxHeight,
      this.minWidth = 100,
      this.maxWidth})
      : super(key: key);

  final double? max;
  final List<BarDataCustom> listData;
  final double gap;
  final BorderSide? xLineStyle;
  final BorderSide? yLineStyle;
  final bool? showXLine;
  final bool? showYLine;
  final bool? showXLabel;
  final bool? showLabelInside;
  final bool? showYLabel;
  final bool? showValueLabel;
  final bool? showLoading;
  final Color? backgroundColor;
  final TextStyle? xLabelStyle;
  final TextStyle? yLabelStyle;
  final TextStyle? labelInsideStyle;
  final TextStyle? valueLabelStyle;
  final Alignment? labelAlign;
  final Duration? loadingDuration;
  final EdgeInsetsGeometry? labelPadding;
  final BorderRadius? radiusBar;
  final double minHeight;
  final double? maxHeight;
  final double minWidth;
  final double? maxWidth;
  final double? spaceXLabeltoChart;
  final double? spaceYLabeltoChart;
  final double? spaceXLinetoChart;
  final double? spaceYLinetoChart;

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
      style: widget.yLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  Widget maxLabel() {
    return Text(
      _numberAutoDigit(max),
      style: widget.yLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  BorderSide xLine() {
    return (widget.showXLine ?? false)
        ? widget.xLineStyle != null
            ? widget.xLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  BorderSide yLine() {
    return (widget.showYLine ?? false)
        ? widget.yLineStyle != null
            ? widget.yLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(builder: (context, constraintsOut) {
      return Row(
        children: [
          if (widget.showYLabel ?? false)
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
                        ((widget.showXLine ?? false)
                            ? (widget.xLineStyle == null
                                ? 0
                                : widget.xLineStyle!.width)
                            : 0) -
                        (widget.spaceXLinetoChart ?? 0),
                  ),
                  child: minLabel(),
                ),
              ],
            ),
          SizedBox(width: widget.spaceYLabeltoChart ?? 5),
          Expanded(
            child: Container(
              height: constraintsOut.maxHeight,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                border: Border(
                  bottom: xLine(),
                  left: yLine(),
                ),
              ),
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
                            padding: EdgeInsets.only(right: widget.gap),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: widget.minHeight,
                                  minWidth: widget.minWidth),
                              child: SizedBox(
                                height: ((item.value.abs() / max) *
                                        constraintsChart.maxHeight) +
                                    widget.minHeight,
                                width: (constraintsChart.maxWidth /
                                        widget.listData.length) -
                                    widget.gap,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 20),
                                  child: Stack(
                                    children: [
                                      if (widget.showValueLabel ?? false)
                                        Transform.translate(
                                          offset: const Offset(0, -20),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: item.valueCustom ??
                                                Text(
                                                  _numberAutoDigit(item.value),
                                                  style:
                                                      widget.valueLabelStyle ??
                                                          item.valueStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                        ),
                                      _BarItemValueView(
                                        showxLabelInside:
                                            widget.showLabelInside,
                                        barDataCustom: item,
                                        labelPadding: widget.labelPadding,
                                        labelAlign: widget.labelAlign,
                                        radiusBar: widget.radiusBar,
                                        labelInsideStyle:
                                            widget.labelInsideStyle,
                                        verticalOffsetTooltip:
                                            (((item.value / max) *
                                                        constraintsChart
                                                            .maxHeight) *
                                                    0.5) +
                                                4,
                                      ),
                                      if (widget.showXLabel ?? false)
                                        Transform.translate(
                                          offset: Offset(
                                            0,
                                            15 +
                                                (widget.spaceXLabeltoChart ??
                                                    5) +
                                                ((widget.showXLine ?? false)
                                                    ? (widget.xLineStyle == null
                                                        ? 0
                                                        : widget
                                                            .xLineStyle!.width)
                                                    : 0) +
                                                (widget.spaceXLinetoChart ?? 0),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: item.labelCustom ??
                                                Text(
                                                  item.label,
                                                  style: widget.xLabelStyle,
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
        ],
      );
    });
  }
}

class BarDataCustom {
  final Color? color;
  final Color? splashColor;
  final String? valueTooltip;
  final String label;
  final TextStyle? valueStyle;
  final TextStyle? labelInsideStyle;
  final double value;
  final double? elevation;
  final Widget? labelCustom;
  final Widget? valueCustom;
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
    this.labelInsideStyle,
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
    this.showxLabelInside,
    this.labelInsideStyle,
  }) : super(key: key);

  final BarDataCustom barDataCustom;
  final Alignment? labelAlign;
  final EdgeInsetsGeometry? labelPadding;
  final double verticalOffsetTooltip;
  final bool? showxLabelInside;
  final TextStyle? labelInsideStyle;
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
            if (showxLabelInside ?? false)
              InkWell(
                splashColor: barDataCustom.splashColor,
                onTap: barDataCustom.onTap == null
                    ? null
                    : () => barDataCustom.onTap!(),
                child: barDataCustom.labelCustom ??
                    Align(
                      alignment: labelAlign ?? Alignment.topCenter,
                      child: Padding(
                        padding: labelPadding ?? const EdgeInsets.all(4),
                        child: Text(
                          barDataCustom.label,
                          style: labelInsideStyle ??
                              barDataCustom.labelInsideStyle,
                        ),
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
