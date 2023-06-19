// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_conditional_assignment

import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:math' show min, max;
import 'dart:ui' show FlutterView;
import 'dart:async' show Completer;
import 'package:flutter/widgets.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this);

  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this);

  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  double get sw => ScreenUtil().screenWidth * this;

  ///Multiple of screen height
  double get sh => ScreenUtil().screenHeight * this;

  ///[ScreenUtil.setHeight]
  Widget get verticalSpace => ScreenUtil().setVerticalSpacing(this);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  Widget get verticalSpaceFromWidth =>
      ScreenUtil().setVerticalSpacingFromWidth(this);

  ///[ScreenUtil.setWidth]
  Widget get horizontalSpace => ScreenUtil().setHorizontalSpacing(this);

  ///[ScreenUtil.radius]
  Widget get horizontalSpaceRadius =>
      ScreenUtil().setHorizontalSpacingRadius(this);

  ///[ScreenUtil.radius]
  Widget get verticalSpacingRadius =>
      ScreenUtil().setVerticalSpacingRadius(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );
}

extension BorderRaduisExtension on BorderRadius {
  /// Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );

  BorderRadius get w => copyWith(
        bottomLeft: bottomLeft.w,
        bottomRight: bottomRight.w,
        topLeft: topLeft.w,
        topRight: topRight.w,
      );

  BorderRadius get h => copyWith(
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
        topLeft: topLeft.h,
        topRight: topRight.h,
      );
}

extension RaduisExtension on Radius {
  /// Creates adapt Radius using r [SizeExtension].
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}

extension BoxConstraintsExtension on BoxConstraints {
  /// Creates adapt BoxConstraints using r [SizeExtension].
  BoxConstraints get r => copyWith(
        maxHeight: maxHeight.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        minWidth: minWidth.r,
      );

  /// Creates adapt BoxConstraints using h-w [SizeExtension].
  BoxConstraints get hw => copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.w,
        minHeight: minHeight.h,
        minWidth: minWidth.w,
      );

  BoxConstraints get w => copyWith(
        maxHeight: maxHeight.w,
        maxWidth: maxWidth.w,
        minHeight: minHeight.w,
        minWidth: minWidth.w,
      );

  BoxConstraints get h => copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.h,
        minHeight: minHeight.h,
        minWidth: minWidth.h,
      );
}

class ScreenUtil {
  static const Size defaultSize = Size(360, 690);
  static ScreenUtil _instance = ScreenUtil._();

  /// UI设计中手机尺寸 , dp
  /// Size of the phone in UI Design , dp
  late Size _uiSize;

  ///屏幕方向
  late Orientation _orientation;

  late double _screenWidth;
  late double _screenHeight;
  late bool _minTextAdapt;
  BuildContext? _context;
  late bool _splitScreenMode;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  /// Manually wait for window size to be initialized
  ///
  /// `Recommended` to use before you need access window size
  /// or in custom splash/bootstrap screen [FutureBuilder]
  ///
  /// example:
  /// ```dart
  /// ...
  /// ScreenUtil.init(context, ...);
  /// ...
  ///   FutureBuilder(
  ///     future: Future.wait([..., ensureScreenSize(), ...]),
  ///     builder: (context, snapshot) {
  ///       if (snapshot.hasData) return const HomeScreen();
  ///       return Material(
  ///         child: LayoutBuilder(
  ///           ...
  ///         ),
  ///       );
  ///     },
  ///   )
  /// ```
  static Future<void> ensureScreenSize([
    FlutterView? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    window ??= WidgetsBinding.instance.platformDispatcher.implicitView;

    if (window?.physicalGeometry.isEmpty == true) {
      return Future.delayed(duration, () async {
        binding.deferFirstFrame();
        await ensureScreenSize(window, duration);
        return binding.allowFirstFrame();
      });
    }
  }

  Set<Element>? _elementsToRebuild;

  /// ### Experimental
  /// Register current page and all its descendants to rebuild.
  /// Helpful when building for web and desktop
  static void registerToBuild(
    BuildContext context, [
    bool withDescendants = false,
  ]) {
    (_instance._elementsToRebuild ??= {}).add(context as Element);

    if (withDescendants) {
      context.visitChildren((element) {
        registerToBuild(element, true);
      });
    }
  }

  /// Initializing the library.
  static Future<void> init(BuildContext context,
      {Size designSize = defaultSize,
      bool splitScreenMode = false,
      bool minTextAdapt = false,
      bool scaleByHeight = false}) async {
    final mediaQueryContext =
        context.getElementForInheritedWidgetOfExactType<MediaQuery>();

    final initCompleter = Completer<void>();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      mediaQueryContext?.visitChildElements((el) => _instance._context = el);
      if (_instance._context != null) initCompleter.complete();
    });

    final deviceData = MediaQuery.maybeOf(context).nonEmptySizeOrNull();

    final deviceSize = deviceData?.size ?? designSize;
    final orientation = deviceData?.orientation ??
        (deviceSize.width > deviceSize.height
            ? Orientation.landscape
            : Orientation.portrait);

    _instance
      .._context = scaleByHeight ? null : context
      .._uiSize = designSize
      .._splitScreenMode = splitScreenMode
      .._minTextAdapt = minTextAdapt
      .._orientation = orientation
      .._screenWidth = scaleByHeight
          ? (deviceSize.height * designSize.width) / designSize.height
          : deviceSize.width
      .._screenHeight = deviceSize.height;

    _instance._elementsToRebuild?.forEach((el) => el.markNeedsBuild());

    return initCompleter.future;
  }

  ///获取屏幕方向
  ///Get screen orientation
  Orientation get orientation => _orientation;

  /// 每个逻辑像素的字体像素数，字体的缩放比例
  /// The number of font pixels for each logical pixel.
  double get textScaleFactor =>
      _context != null ? MediaQuery.of(_context!).textScaleFactor : 1;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  double? get pixelRatio =>
      _context != null ? MediaQuery.of(_context!).devicePixelRatio : 1;

  /// 当前设备宽度 dp
  /// The horizontal extent of this size.
  double get screenWidth =>
      _context != null ? MediaQuery.of(_context!).size.width : _screenWidth;

  ///当前设备高度 dp
  ///The vertical extent of this size. dp
  double get screenHeight =>
      _context != null ? MediaQuery.of(_context!).size.height : _screenHeight;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top, in dp
  double get statusBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.top;

  /// 底部安全区距离 dp
  /// The offset from the bottom, in dp
  double get bottomBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.bottom;

  /// 实际尺寸与UI设计的比例
  /// The ratio of actual width to UI design
  double get scaleWidth => screenWidth / _uiSize.width;

  ///  /// The ratio of actual height to UI design
  double get scaleHeight =>
      (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
      _uiSize.height;

  double get scaleText =>
      _minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;

  /// 根据UI设计的设备宽度适配
  /// 高度也可以根据这个来做适配可以保证不变形,比如你想要一个正方形的时候.
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// 根据UI设计的设备高度适配
  /// 当发现UI设计中的一屏显示的与当前样式效果不符合时,
  /// 或者形状有差异时,建议使用此方法实现高度适配.
  /// 高度适配主要针对想根据UI设计的一屏展示一样的效果
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///根据宽度或高度中的较小值进行适配
  ///Adapt according to the smaller of width or height
  double radius(num r) => r * min(scaleWidth, scaleHeight);

  ///字体大小适配方法
  ///- [fontSize] UI设计上字体的大小,单位dp.
  ///Font size adaptation method
  ///- [fontSize] The size of the font on the UI design, in dp.
  double setSp(num fontSize) => fontSize * scaleText;

  Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  Widget setVerticalSpacingFromWidth(num height) =>
      SizedBox(height: setWidth(height));

  Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  Widget setHorizontalSpacingRadius(num width) =>
      SizedBox(width: radius(width));

  Widget setVerticalSpacingRadius(num height) =>
      SizedBox(height: radius(height));
}

extension on MediaQueryData? {
  MediaQueryData? nonEmptySizeOrNull() {
    if (this?.size.isEmpty ?? true)
      return null;
    else
      return this;
  }
}

typedef RebuildFactor = bool Function(MediaQueryData old, MediaQueryData data);

typedef ScreenUtilInitBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

class RebuildFactors {
  const RebuildFactors._();

  static bool size(MediaQueryData old, MediaQueryData data) {
    return old.size != data.size;
  }

  static bool orientation(MediaQueryData old, MediaQueryData data) {
    return old.orientation != data.orientation;
  }

  static bool sizeAndViewInsets(MediaQueryData old, MediaQueryData data) {
    return old.viewInsets != data.viewInsets;
  }

  static bool all(MediaQueryData old, MediaQueryData data) {
    return old != data;
  }
}

class ScreenUtilInit extends StatefulWidget {
  /// A helper widget that initializes [ScreenUtil]
  const ScreenUtilInit(
      {Key? key,
      required this.builder,
      this.child,
      this.rebuildFactor = RebuildFactors.size,
      this.designSize = ScreenUtil.defaultSize,
      this.splitScreenMode = false,
      this.minTextAdapt = false,
      this.useInheritedMediaQuery = false,
      this.scaleByHeight = false})
      : super(key: key);

  final ScreenUtilInitBuilder builder;
  final Widget? child;
  final bool splitScreenMode;
  final bool minTextAdapt;
  final bool useInheritedMediaQuery;
  final bool scaleByHeight;
  final RebuildFactor rebuildFactor;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;

  @override
  State<ScreenUtilInit> createState() => _ScreenUtilInitState();
}

class _ScreenUtilInitState extends State<ScreenUtilInit>
    with WidgetsBindingObserver {
  MediaQueryData? _mediaQueryData;

  bool wrappedInMediaQuery = false;

  WidgetsBinding get binding => WidgetsFlutterBinding.ensureInitialized();

  MediaQueryData get mediaQueryData => _mediaQueryData!;

  MediaQueryData get newData {
    if (widget.useInheritedMediaQuery) {
      final data = MediaQuery.maybeOf(context);

      if (data != null) {
        wrappedInMediaQuery = true;
        return data;
      }
    }

    return MediaQueryData.fromView(View.of(context));
  }

  Widget get child {
    return widget.builder.call(context, widget.child);
  }

  _updateTree(Element el) {
    el.markNeedsBuild();
    el.visitChildren(_updateTree);
  }

  @override
  void initState() {
    super.initState();
    // mediaQueryData = newData;
    binding.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final old = _mediaQueryData!;
    final data = newData;

    if (widget.scaleByHeight || widget.rebuildFactor(old, data)) {
      _mediaQueryData = data;
      _updateTree(context as Element);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_mediaQueryData == null) _mediaQueryData = newData;
    didChangeMetrics();
  }

  @override
  void dispose() {
    binding.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext _context) {
    if (mediaQueryData.size == Size.zero) return const SizedBox.shrink();
    if (!wrappedInMediaQuery) {
      return MediaQuery(
        // key: GlobalObjectKey('mediaQuery'),
        data: mediaQueryData,
        child: Builder(
          builder: (__context) {
            final deviceData = MediaQuery.maybeOf(__context);
            final deviceSize = deviceData?.size ?? widget.designSize;
            ScreenUtil.init(__context,
                designSize: widget.designSize,
                splitScreenMode: widget.splitScreenMode,
                minTextAdapt: widget.minTextAdapt,
                scaleByHeight: widget.scaleByHeight);
            return Container(
                width: deviceSize.width,
                height: deviceSize.height,
                child: FittedBox(
                  fit: BoxFit.none,
                  alignment: Alignment.center,
                  child: Container(
                    width: widget.scaleByHeight
                        ? (deviceSize.height * widget.designSize.width) /
                            widget.designSize.height
                        : deviceSize.width,
                    height: deviceSize.height,
                    child: child,
                  ),
                ));
          },
        ),
      );
    }

    ScreenUtil.init(_context,
        designSize: widget.designSize,
        splitScreenMode: widget.splitScreenMode,
        minTextAdapt: widget.minTextAdapt,
        scaleByHeight: widget.scaleByHeight);
    final deviceData = MediaQuery.maybeOf(_context);

    final deviceSize = deviceData?.size ?? widget.designSize;
    return Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: FittedBox(
          fit: BoxFit.none,
          alignment: Alignment.center,
          child: Container(
            width: widget.scaleByHeight
                ? (deviceSize.height * widget.designSize.width) /
                    widget.designSize.height
                : deviceSize.width,
            height: deviceSize.height,
            child: child,
          ),
        ));
  }
}
