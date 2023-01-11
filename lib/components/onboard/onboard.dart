// ignore_for_file: must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardCustom extends StatefulWidget {
  final List<CustomPage> page;
  final double? height;
  final Text? textButtonSkip;
  final Text? textButtonStart;
  final Icon? iconButtonPrevious;
  final Icon? iconButtonNext;
  final Color? buttonColor;
  final Color? indicatorColor;
  final void Function()? onTapStart;

  const OnBoardCustom({
    super.key,
    required this.page,
    this.textButtonSkip,
    this.iconButtonPrevious,
    this.buttonColor,
    this.indicatorColor,
    this.onTapStart,
    this.iconButtonNext,
    this.textButtonStart,
    this.height,
  });

  @override
  State<OnBoardCustom> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoardCustom> {
  int _currentPage = 0;

  @override
  void dispose() {
    _currentPage = 0;
    _controller?.dispose();
    super.dispose();
  }

  PageController? _controller = PageController();

  onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 70.h,
          child: PageView.builder(
            onPageChanged: onchanged,
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.page.length,
            itemBuilder: (context, index) {
              return widget.page[index];
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (_currentPage < (widget.page.length - 1) && _currentPage == 0)
                ? InkWell(
                    onTap: () {
                      _controller?.jumpToPage(widget.page.length - 1);
                    },
                    child: widget.textButtonSkip ??
                        Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                  )
                : InkWell(
                    onTap: () {
                      _controller?.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutQuint);
                    },
                    child: widget.iconButtonPrevious ??
                        Icon(
                          Icons.navigate_before,
                          size: 35.sp,
                          color: Colors.black,
                        )),
            Row(
              children: List<Widget>.generate(
                widget.page.length,
                (int index) {
                  return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? widget.indicatorColor ?? Colors.black
                              : widget.indicatorColor?.withOpacity(0.5) ??
                                  Colors.black.withOpacity(0.5)));
                },
              ),
            ),
            (_currentPage == (widget.page.length - 1))
                ? InkWell(
                    onTap: widget.onTapStart,
                    child: widget.textButtonStart ??
                        Text(
                          "Get Start!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                  )
                : InkWell(
                    onTap: () {
                      _controller?.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutQuint);
                    },
                    child: widget.iconButtonNext ??
                        Icon(
                          Icons.navigate_next,
                          size: 35.sp,
                          color: Colors.black,
                        ),
                  ),
          ],
        ),
      ],
    );
  }
}

class CustomPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final double? imageHeight;
  final double? imageWidth;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final Color? titleFontColor;
  final Color? backGroundColor;
  final Color? fontColor;

  const CustomPage(
      {Key? key,
      this.titleFontColor,
      this.titleFontSize,
      this.fontColor,
      this.backGroundColor,
      this.description,
      this.title,
      required this.image,
      this.descriptionFontSize,
      this.imageHeight,
      this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: backGroundColor ?? Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image ?? "",
                height: imageHeight,
                width: imageWidth ?? width * 1,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                title ?? "",
                style: TextStyle(
                    fontSize: titleFontSize ?? 28,
                    fontWeight: FontWeight.bold,
                    color: titleFontColor ?? Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  description ?? "",
                  style: TextStyle(
                    height: 1.3,
                    fontWeight: FontWeight.normal,
                    fontSize: descriptionFontSize ?? 14,
                    letterSpacing: 0.7,
                    color: fontColor ?? Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
