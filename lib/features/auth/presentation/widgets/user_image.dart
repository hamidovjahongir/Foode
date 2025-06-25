import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';

class UserImage extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final Icon icon;
  final Image? image;
  UserImage({
    super.key,
    this.radius,
    this.width,
    this.height,
    required this.icon,
    this.image,
  });

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 250,
      height: widget.height ?? 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ?? 250),
      ),
      child: Stack(
        children: [
          widget.image ?? Text("Rasim yoq"),
          Positioned(
            top: 200,
            left: 200,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.red,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
