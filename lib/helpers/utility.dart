import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utility {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  static void showDialogProgress(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void dismissDialogProgress(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  static Widget appButton(
      BuildContext context, String text, Function onClicked,
      {double? width,
      double? height,
      Color? color,
      Color? textColor,
      FontWeight? fontWeight,
      double leftPadding = 15.0,
      Widget? imageWidget,
      double radius = 10.0,
      double? fontSize,
      double rightPadding = 15.0,
      double bottomPadding = 15.0,
      Color? borderColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding, right: rightPadding, bottom: bottomPadding),
      child: SizedBox(
        height: height ?? 7.h,
        width: width ?? Get.width / 1.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            elevation: 0,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(width: 2,
                  color: borderColor ?? Colors.transparent,
                )),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          onPressed: () {
            onClicked();
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget ?? Container(),

              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: fontSize ?? 16.sp,
                      color: textColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: fontWeight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
