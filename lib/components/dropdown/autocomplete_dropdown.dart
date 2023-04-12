// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class AutoCompleteDropdown extends StatelessWidget {
  final TextEditingController? controller;
  final String? initValue;
  final String? hint;
  final String? errorText;
  final bool? onClear;
  final double? borderRadius;
  final Widget? icon;
  final Function(SearchFieldListItem?)? onTap;
  final List<SearchFieldListItem> suggestions;
  final String? Function(String?)? validator;
  final bool isValidate;

  AutoCompleteDropdown({
    super.key,
    this.controller,
    this.initValue,
    this.hint,
    this.onTap,
    required this.suggestions,
    this.onClear,
    this.borderRadius,
    this.icon,
    this.validator,
    this.errorText,
    this.isValidate = false,
  });
  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SearchField(
      focusNode: focus,
      controller: controller,
      suggestions: suggestions,
      validator: validator,
      searchInputDecoration: InputDecoration(
        errorText: errorText,
        errorStyle: KLabelTextRegular12.copyWith(
            color: Theme.of(context).colorScheme.error),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        enabledBorder: isValidate
            ? OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide:
                    const BorderSide(color: ThemeColor.DARK_D4, width: 1.0),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          borderSide: const BorderSide(color: ThemeColor.PRIMARY_5, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColor.DARK_D4, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        suffix: onClear == true
            ? InkWell(
                onTap: () {
                  controller?.clear();
                },
                child: Transform.translate(
                    offset: const Offset(0, 2),
                    child: const Icon(CupertinoIcons.xmark, size: 16)))
            : const SizedBox.shrink(),
        suffixIcon: icon ?? const Icon(Icons.keyboard_arrow_down_sharp),
        focusedBorder: isValidate
            ? OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: const BorderSide(
                    color: ThemeColor.PRIMARY_MAIN, width: 1.0),
              ),
      ),
      // onTap:onTap ,
      searchStyle: KLabelTextRegular12,
      suggestionStyle: KLabelTextRegular12,
      hint: hint,
      suggestionsDecoration: BoxDecoration(
        color: ThemeColor.LIGHT_WHITE,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 2),
          ),
        ],
      ),
      onSuggestionTap: onTap,
      hasOverlay: true,
      suggestionDirection: SuggestionDirection.down,
      suggestionItemDecoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 0.25,
      ))),
      marginColor: ThemeColor.DARK_D4,
      textInputAction: TextInputAction.done,
      autoCorrect: true,
      suggestionState: Suggestion.expand,
    );
  }
}

//=======================Suggestion=============================

enum Suggestion {
  expand,
  hidden,
}

enum SuggestionAction {
  next,
  unfocus,
}

enum SuggestionDirection {
  down,
  up,
}

class SearchFieldListItem<T> {
  Key? key;
  final String searchKey;
  final T? item;
  final Widget? child;
  SearchFieldListItem(this.searchKey, {this.child, this.item, this.key});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchFieldListItem &&
            runtimeType == other.runtimeType &&
            searchKey == other.searchKey;
  }

  @override
  int get hashCode => searchKey.hashCode;
}

extension ListContainsObject<T> on List {
  bool containsObject(T object) {
    for (var item in this) {
      if (object == item) {
        return true;
      }
    }
    return false;
  }
}

class SearchField<T> extends StatefulWidget {
  final FocusNode? focusNode;
  final List<SearchFieldListItem<T>> suggestions;
  final Function(SearchFieldListItem<T>)? onSuggestionTap;
  final bool? enabled;
  final Function(String)? onSubmit;
  final String? hint;
  final TextInputAction? textInputAction;
  final SearchFieldListItem<T>? initialValue;
  final TextStyle? searchStyle;
  final TextStyle? suggestionStyle;
  final InputDecoration? searchInputDecoration;
  final Suggestion suggestionState;
  final SuggestionAction? suggestionAction;
  final BoxDecoration? suggestionsDecoration;
  final BoxDecoration? suggestionItemDecoration;
  final double itemHeight;
  final Color? marginColor;
  final int maxSuggestionsInViewPort;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool scrollbarAlwaysVisible;
  final bool hasOverlay;
  final Offset? offset;
  final Widget emptyWidget;
  final bool Function(String inputText, String suggestionKey)? comparator;
  final bool autoCorrect;
  final List<TextInputFormatter>? inputFormatters;
  final SuggestionDirection suggestionDirection;

  SearchField(
      {Key? key,
      required this.suggestions,
      this.autoCorrect = true,
      this.controller,
      this.emptyWidget = const SizedBox.shrink(),
      this.focusNode,
      this.hasOverlay = true,
      this.hint,
      this.initialValue,
      this.inputFormatters,
      this.inputType,
      this.itemHeight = 35.0,
      this.marginColor,
      this.maxSuggestionsInViewPort = 5,
      this.enabled,
      this.onSubmit,
      this.offset,
      this.onSuggestionTap,
      this.searchInputDecoration,
      this.searchStyle,
      this.scrollbarAlwaysVisible = true,
      this.suggestionStyle,
      this.suggestionsDecoration,
      this.suggestionDirection = SuggestionDirection.down,
      this.suggestionState = Suggestion.expand,
      this.suggestionItemDecoration,
      this.suggestionAction,
      this.textInputAction,
      this.validator,
      this.comparator})
      : assert(
            (initialValue != null &&
                    suggestions.containsObject(initialValue)) ||
                initialValue == null,
            'Initial value should either be null or should be present in suggestions list.'),
        super(key: key);

  @override
  _SearchFieldState<T> createState() => _SearchFieldState();
}

class _SearchFieldState<T> extends State<SearchField<T>> {
  final StreamController<List<SearchFieldListItem<T>?>?> suggestionStream =
      StreamController<List<SearchFieldListItem<T>?>?>.broadcast();
  FocusNode? _focus;
  bool isSuggestionExpanded = false;
  TextEditingController? searchController;

  @override
  void dispose() {
    suggestionStream.close();
    _scrollController.dispose();
    if (widget.controller == null) {
      searchController!.dispose();
    }
    if (widget.focusNode == null) {
      _focus!.dispose();
    }
    super.dispose();
  }

  void initialize() {
    if (widget.focusNode != null) {
      _focus = widget.focusNode;
    } else {
      _focus = FocusNode();
    }
    _focus!.addListener(() {
      if (mounted) {
        setState(() {
          isSuggestionExpanded = _focus!.hasFocus;
        });
      }
      if (widget.hasOverlay) {
        if (isSuggestionExpanded) {
          if (widget.initialValue == null) {
            if (widget.suggestionState == Suggestion.expand) {
              Future.delayed(const Duration(milliseconds: 100), () {
                suggestionStream.sink.add(widget.suggestions);
              });
            }
          }
          Overlay.of(context).insert(_overlayEntry!);
        } else {
          if (_overlayEntry != null && _overlayEntry!.mounted) {
            _overlayEntry?.remove();
          }
        }
      } else {
        if (isSuggestionExpanded) {
          if (widget.initialValue == null) {
            if (widget.suggestionState == Suggestion.expand) {
              Future.delayed(const Duration(milliseconds: 100), () {
                suggestionStream.sink.add(widget.suggestions);
              });
            } else {
              Future.delayed(const Duration(milliseconds: 100), () {
                suggestionStream.sink.add(null);
              });
            }
          }
        } else {
          Future.delayed(const Duration(milliseconds: 100), () {
            suggestionStream.sink.add(null);
          });
        }
      }
    });
  }

  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
    searchController = widget.controller ?? TextEditingController();
    initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _overlayEntry = _createOverlay();
        if (widget.initialValue == null ||
            widget.initialValue!.searchKey.isEmpty) {
          suggestionStream.sink.add(null);
        } else {
          searchController!.text = widget.initialValue!.searchKey;
          suggestionStream.sink.add([widget.initialValue]);
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant SearchField<T> oldWidget) {
    if (oldWidget.controller != widget.controller) {
      searchController = widget.controller ?? TextEditingController();
    }
    if (oldWidget.hasOverlay != widget.hasOverlay) {
      if (widget.hasOverlay) {
        _overlayEntry = _createOverlay();
        _focus!.removeListener(initialize);
        initialize();
      } else {
        if (_overlayEntry!.mounted) {
          _overlayEntry?.remove();
        }
      }
      if (mounted) {
        setState(() {});
      }
    }
    if (oldWidget.suggestions != widget.suggestions) {
      suggestionStream.sink.add(widget.suggestions);
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget _suggestionsBuilder() {
    return StreamBuilder<List<SearchFieldListItem<T>?>?>(
      stream: suggestionStream.stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<SearchFieldListItem<T>?>?> snapshot) {
        if (snapshot.data == null || !isSuggestionExpanded) {
          return const SizedBox();
        } else if (snapshot.data!.isEmpty) {
          return widget.emptyWidget;
        } else {
          if (snapshot.data!.length > widget.maxSuggestionsInViewPort) {
            _totalHeight = widget.itemHeight * widget.maxSuggestionsInViewPort;
          } else if (snapshot.data!.length == 1) {
            _totalHeight = widget.itemHeight;
          } else {
            _totalHeight = snapshot.data!.length * widget.itemHeight;
          }
          final onSurfaceColor = Theme.of(context).colorScheme.onSurface;

          final Widget listView = ListView.builder(
            reverse: widget.suggestionDirection == SuggestionDirection.up,
            padding: EdgeInsets.zero,
            controller: _scrollController,
            itemCount: snapshot.data!.length,
            physics: snapshot.data!.length == 1
                ? const NeverScrollableScrollPhysics()
                : const ScrollPhysics(),
            itemBuilder: (context, index) => TextFieldTapRegion(
                child: InkWell(
              onTap: () {
                searchController!.text = snapshot.data![index]!.searchKey;
                searchController!.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: searchController!.text.length,
                  ),
                );

                if (widget.suggestionAction != null) {
                  if (widget.suggestionAction == SuggestionAction.next) {
                    _focus!.nextFocus();
                  } else if (widget.suggestionAction ==
                      SuggestionAction.unfocus) {
                    _focus!.unfocus();
                  }
                }

                suggestionStream.sink.add(null);
                if (widget.onSuggestionTap != null) {
                  widget.onSuggestionTap!(snapshot.data![index]!);
                }
              },
              child: Container(
                height: widget.itemHeight,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: widget.suggestionItemDecoration?.copyWith(
                      border: widget.suggestionItemDecoration?.border ??
                          Border(
                            bottom: BorderSide(
                              color: widget.marginColor ??
                                  onSurfaceColor.withOpacity(0.1),
                            ),
                          ),
                    ) ??
                    BoxDecoration(
                      border: index == snapshot.data!.length - 1
                          ? null
                          : Border(
                              bottom: BorderSide(
                                color: widget.marginColor ??
                                    onSurfaceColor.withOpacity(0.1),
                              ),
                            ),
                    ),
                child: snapshot.data![index]!.child ??
                    Text(
                      snapshot.data![index]!.searchKey,
                      style: widget.suggestionStyle,
                    ),
              ),
            )),
          );

          return AnimatedContainer(
            duration: widget.suggestionDirection == SuggestionDirection.up
                ? Duration.zero
                : const Duration(milliseconds: 300),
            height: _totalHeight,
            alignment: Alignment.centerLeft,
            decoration: widget.suggestionsDecoration ??
                BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: onSurfaceColor.withOpacity(0.1),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      offset: widget.hasOverlay
                          ? const Offset(
                              2.0,
                              5.0,
                            )
                          : const Offset(1.0, 0.5),
                    ),
                  ],
                ),
            child: RawScrollbar(
                thumbVisibility: widget.scrollbarAlwaysVisible,
                controller: _scrollController,
                padding: EdgeInsets.zero,
                child: listView),
          );
        }
      },
    );
  }

  Offset? getYOffset(
      Offset textFieldOffset, Size textFieldSize, int suggestionsCount) {
    if (mounted) {
      final size = MediaQuery.of(context).size;
      final isSpaceAvailable = size.height >
          textFieldOffset.dy + textFieldSize.height + _totalHeight;
      if (widget.suggestionDirection == SuggestionDirection.down) {
        return Offset(0, textFieldSize.height);
      } else if (widget.suggestionDirection == SuggestionDirection.up) {
        // search results should not exceed maxSuggestionsInViewPort
        if (suggestionsCount > widget.maxSuggestionsInViewPort) {
          return Offset(
              0, -(widget.itemHeight * widget.maxSuggestionsInViewPort));
        } else {
          return Offset(0, -(widget.itemHeight * suggestionsCount));
        }
      } else {
        if (!_isDirectionCalculated) {
          _isDirectionCalculated = true;
          if (isSpaceAvailable) {
            _offset = Offset(0, textFieldSize.height);
            return _offset;
          } else {
            if (suggestionsCount > widget.maxSuggestionsInViewPort) {
              _offset = Offset(
                  0, -(widget.itemHeight * widget.maxSuggestionsInViewPort));
              return _offset;
            } else {
              _offset = Offset(0, -(widget.itemHeight * suggestionsCount));
              return _offset;
            }
          }
        } else {
          return _offset;
        }
      }
    }
    return null;
  }

  OverlayEntry _createOverlay() {
    final textFieldRenderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final textFieldsize = textFieldRenderBox.size;
    final offset = textFieldRenderBox.localToGlobal(Offset.zero);
    var yOffset = Offset.zero;
    return OverlayEntry(
        builder: (context) => StreamBuilder<List<SearchFieldListItem?>?>(
            stream: suggestionStream.stream,
            builder: (BuildContext context,
                AsyncSnapshot<List<SearchFieldListItem?>?> snapshot) {
              late var count = widget.maxSuggestionsInViewPort;
              if (snapshot.data != null) {
                count = snapshot.data!.length;
              }
              yOffset = getYOffset(offset, textFieldsize, count) ?? Offset.zero;
              return Positioned(
                left: offset.dx,
                width: textFieldsize.width,
                child: CompositedTransformFollower(
                    offset: widget.offset ?? yOffset,
                    link: _layerLink,
                    child: Material(child: _suggestionsBuilder())),
              );
            }));
  }

  final LayerLink _layerLink = LayerLink();
  late double _totalHeight;
  GlobalKey key = GlobalKey();
  bool _isDirectionCalculated = false;
  Offset _offset = Offset.zero;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (widget.suggestions.length > widget.maxSuggestionsInViewPort) {
      _totalHeight = widget.itemHeight * widget.maxSuggestionsInViewPort;
    } else {
      _totalHeight = widget.suggestions.length * widget.itemHeight;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            key: key,
            enabled: widget.enabled,
            autocorrect: widget.autoCorrect,
            onFieldSubmitted: (x) {
              if (widget.onSubmit != null) widget.onSubmit!(x);
            },
            onTap: () {
              if (!isSuggestionExpanded &&
                  widget.suggestionState == Suggestion.expand) {
                suggestionStream.sink.add(widget.suggestions);
                if (mounted) {
                  setState(() {
                    isSuggestionExpanded = true;
                  });
                }
              }
            },
            inputFormatters: widget.inputFormatters,
            controller: widget.controller ?? searchController,
            focusNode: _focus,
            validator: widget.validator,
            style: widget.searchStyle,
            textInputAction: widget.textInputAction,
            keyboardType: widget.inputType,
            decoration:
                widget.searchInputDecoration?.copyWith(hintText: widget.hint) ??
                    InputDecoration(hintText: widget.hint),
            onChanged: (query) {
              final searchResult = <SearchFieldListItem<T>>[];
              if (query.isEmpty) {
                _createOverlay();
                suggestionStream.sink.add(widget.suggestions);
                return;
              }
              for (final suggestion in widget.suggestions) {
                if (widget.comparator != null) {
                  if (widget.comparator!(query, suggestion.searchKey)) {
                    searchResult.add(suggestion);
                  }
                } else if (suggestion.searchKey
                    .toLowerCase()
                    .contains(query.toLowerCase())) {
                  searchResult.add(suggestion);
                }
              }
              suggestionStream.sink.add(searchResult);
            },
          ),
        ),
        if (!widget.hasOverlay)
          SizedBox(
            height: widget.offset != null ? widget.offset!.dy : 0,
          ),
        if (!widget.hasOverlay) _suggestionsBuilder()
      ],
    );
  }
}
