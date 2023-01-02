// ignore_for_file: must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardCustom extends StatefulWidget {
  final List<CPage> page;

  const OnBoardCustom({super.key, required this.page});

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
                          ? Colors.deepPurple[400]
                          : Colors.deepPurple.withOpacity(0.5)));
            })),
        InkWell(
          onTap: () {
            _controller?.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutQuint);
          },
          child: AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            height: 15.w,
            width: (_currentPage == (widget.page.length - 1)) ? 200 : 75,
            decoration: BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.circular(35)),
            child: (_currentPage == (widget.page.length - 1))
                ? const FittedBox(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                : const Icon(
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

  const CPage({Key? key, this.description, this.title, this.image})
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
                width: width * 0.7,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                title ?? "",
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  description ?? "",
                  style: const TextStyle(
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
