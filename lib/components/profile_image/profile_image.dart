// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:component_sdk/component_sdk.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImageCustom extends StatelessWidget {
  final String? urlImage;
  final double? imageWidth;
  final double? imageHeight;
  final double? borderRadius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDefaultImageTap;
  final GestureTapCallback? onTapEdit;
  final Color? borderColor;
  final double? borderWidth;
  final bool isEdit;
  final File? imageFile;
  final bool isServicePic;
  final ImageProvider<Object>? defaultImage;
  final Widget? editIcon;
  final String? defaultIcon;

  const ProfileImageCustom(
      {Key? key,
      this.imageFile,
      this.isServicePic = false,
      this.onTap,
      this.onTapEdit,
      this.urlImage,
      this.isEdit = false,
      this.imageWidth,
      this.imageHeight,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.onDefaultImageTap,
      this.defaultImage,
      this.editIcon,
      this.defaultIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageFile != null
        ? Stack(
            children: [
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.5, color: ThemeColor.DARK_D4),
                  image: DecorationImage(
                    image: FileImage(imageFile!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 5,
                  child: InkWell(
                    highlightColor: ThemeColor.NoColor,
                    onTap: onTap,
                    child: editIcon ??
                        Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.shade100,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.blue, width: 2)),
                            child: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 18,
                            )),
                  )),
            ],
          )
        : urlImage == null || urlImage == ""
            ? Stack(
                children: [
                  Container(
                    width: imageWidth ?? 20.w,
                    height: imageWidth ?? 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: ThemeColor.DARK_D4,
                            offset: Offset(0, 0),
                            spreadRadius: 0.5),
                      ],
                      image: DecorationImage(
                        image: AssetImage(defaultIcon ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  isEdit
                      ? Positioned(
                          bottom: 0,
                          right: 5,
                          child: InkWell(
                            highlightColor: ThemeColor.NoColor,
                            onTap: onDefaultImageTap,
                            child: editIcon ??
                                Container(
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent.shade100,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.blue, width: 2)),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                      size: 18,
                                    )),
                          ))
                      : SizedBox.shrink(),
                ],
              )
            : CachedNetworkImage(
                imageUrl: "$urlImage",
                key: UniqueKey(),
                width: imageWidth,
                height: imageHeight,
                memCacheHeight: 47,
                memCacheWidth: 47,
                imageBuilder: (context, imageProvider) => Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColor.LIGHT_WHITE,
                        shape: isServicePic == true
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        border: Border.all(
                            width: borderWidth ?? 0,
                            color: borderColor ?? ThemeColor.PRIMARY_Subtle),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    isEdit
                        ? Positioned(
                            bottom: 0,
                            right: 5,
                            child: InkWell(
                              highlightColor: ThemeColor.NoColor,
                              onTap: onTapEdit,
                              child: editIcon ??
                                  Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.lightBlueAccent.shade100,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.blue, width: 2)),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                        size: 18,
                                      )),
                            ))
                        : SizedBox.shrink(),
                  ],
                ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        ThemeColor.PRIMARY_MAIN),
                    strokeWidth: 3,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                    child: Container(
                  width: imageWidth ?? 20.w,
                  height: imageWidth ?? 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: ThemeColor.DARK_D4,
                            offset: Offset(0, 0),
                            spreadRadius: 0.5),
                      ],
                      image: DecorationImage(
                        image: AssetImage(defaultIcon ?? ''),
                        fit: BoxFit.cover,
                      )),
                )),
              );
  }
}
