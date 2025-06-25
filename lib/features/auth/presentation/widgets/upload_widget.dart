import 'package:flutter/cupertino.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';

class UploadWidget extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final Icon icon;
  final String title;
  final Color color;

  UploadWidget({
    super.key,
    this.radius,
    this.width,
    this.height,
    required this.icon,
    required this.title,
    required this.color,
  });
  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
      height: widget.height ?? 180,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.radius ?? 20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.red.withOpacity(0.2),
              ),
              child: Center(
                child: widget.icon,
              ),

            ),
            Text(
              widget.title,
              style: AppTextStyles.s16w600.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.neutralBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
