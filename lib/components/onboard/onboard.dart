// ignore_for_file: must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardCustom extends StatefulWidget {
  final List<CPage> page;
  final Text? textButton;
  final Icon? iconButton;
  final Color? buttonColor;
  final Color? indicatorColor;
  final double? buttonHeight;
  final void Function()? onTap;

  const OnBoardCustom({
    super.key,
    required this.page,
    this.textButton,
    this.iconButton,
    this.buttonColor,
    this.indicatorColor,
    this.buttonHeight,
    this.onTap,
  });

  @override
  State<OnBoardCustom> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoardCustom> {
  int _currentPage = 0;

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
          height: 70.h,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(widget.page.length, (int index) {
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: (index == _currentPage) ? 30 : 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                          ? widget.indicatorColor ?? Colors.deepPurple[400]
                          : widget.indicatorColor?.withOpacity(0.5) ??
                              Colors.deepPurple.withOpacity(0.5)));
            })),
        (_currentPage == (widget.page.length - 1))
            ? InkWell(
                onTap: widget.onTap,
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 6.5.h,
                  width: 200,
                  decoration: BoxDecoration(
                      color: widget.buttonColor ?? Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(35)),
                  child: const FittedBox(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  _controller?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 6.5.h,
                  width: 75,
                  decoration: BoxDecoration(
                      color: widget.buttonColor ?? Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(35)),
                  child: const Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
      ],
    );
  }
}

class CPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final double? imageWidth;
  final double? imageHeight;

  const CPage(
      {Key? key,
      required this.description,
      required this.title,
      required this.image,
      this.titleTextStyle,
      this.descriptionTextStyle,
      this.imageWidth,
      this.imageHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image ?? "",
                width: imageWidth ?? width * 0.7,
                height: imageHeight,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                title ?? "",
                style: titleTextStyle ??
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  description ?? "",
                  style: descriptionTextStyle ??
                      const TextStyle(
                        height: 1.3,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: 0.7,
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
