import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';

class $ {
  $();

  static String getNow({
    DateTime time,
  }) {
    var now = time != null ? time : new DateTime.now();
    var year = now.year.toString();
    var month = now.month.toString();
    var day = now.day.toString().padLeft(2, '0');
    var hour = now.hour.toString().padLeft(2, '0');
    var minute = now.minute.toString().padLeft(2, '0');
    var second = now.second.toString().padLeft(2, '0');
    return "$year-$month-$day $hour:$minute:$second";
  }

  /// ScreenUtil
  static setWidth(double value) {
    return ScreenUtil().setHeight(value);
  }

  static setHeight(double value) {
    return ScreenUtil().setHeight(value);
  }

  static setSp(double value) {
    return ScreenUtil().setHeight(value);
  }

  static screen() {
    return ScreenUtil();
  }
}

class $theme {
  static double f_12 = $.setSp(24);
  static double f_14 = $.setSp(28);
  static double f_16 = $.setSp(32);
  static double f_18 = $.setSp(36);
  static double f_20 = $.setSp(40);

  static Color grey1 = Color.fromRGBO(144, 144, 144, 1); //灰阶1

  static Color black1 = Color.fromRGBO(16, 16, 16, 1); //黑阶1
}

class ImageUtils {
  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.png';
  }

  // static ImageProvider getImageProvider(String imageUrl, {String holderImg = 'none'}) {
  //   if (TextUtil.isEmpty(imageUrl)) {
  //     return AssetImage(getImgPath(holderImg));
  //   }
  //   return CachedNetworkImageProvider(imageUrl);
  // }
}

/// 加载本地资源图片
class LoadAssetImage extends StatelessWidget {
  const LoadAssetImage(this.image,
      {Key key,
      this.width,
      this.height,
      this.cacheWidth,
      this.cacheHeight,
      this.fit,
      this.format = ImageFormat.png,
      this.color})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit fit;
  final ImageFormat format;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtils.getImgPath(image, format: format),
      height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
    );
  }
}

enum ImageFormat { png, jpg, gif, webp }

// extension ImageFormatExtension on ImageFormat {
//   String get value => ['png', 'jpg', 'gif', 'webp'][this.index];
// }
