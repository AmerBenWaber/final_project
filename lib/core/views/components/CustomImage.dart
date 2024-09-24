import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ImageSourceType { network, asset, memory, file }

class CustomImage extends StatelessWidget {
  final String imageUrl; // رابط أو مسار الصورة
  final BoxFit fit; // طريقة عرض الصورة
  final double height; // ارتفاع افتراضي أو مخصص
  final double width; // عرض افتراضي أو مخصص
  final Widget placeholder; // صورة بديلة أثناء التحميل
  final Widget Function(BuildContext, Object, StackTrace?) errorBuilder; // معالج الأخطاء
  final ImageSourceType sourceType; // نوع مصدر الصورة
  final Uint8List? imageData; // بيانات الصورة في حالة memory

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover, // القيمة الافتراضية لتناسب الصورة
    this.height = 200.0, // ارتفاع افتراضي
    this.width = double.infinity, // عرض افتراضي
    this.placeholder = const Center(child: CircularProgressIndicator()), // صورة افتراضية أثناء التحميل
    this.errorBuilder = _defaultErrorBuilder, // معالج الأخطاء الافتراضي
    required this.sourceType, // تحديد نوع مصدر الصورة
    this.imageData, // بيانات الصورة إذا كانت في الذاكرة
  });

  static Widget _defaultErrorBuilder(BuildContext context, Object error, StackTrace? stackTrace) {
    return const Center(child: Icon(Icons.error, color: Colors.red)); // معالجة خطأ افتراضية
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    switch (sourceType) {
      case ImageSourceType.network:
        imageWidget = Image.network(
          imageUrl,
          fit: fit,
          height: height,
          width: width,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return placeholder;
          },
          errorBuilder: errorBuilder,
        );
        break;

      case ImageSourceType.asset:
        imageWidget = Image.asset(
          imageUrl,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: errorBuilder,
        );
        break;

      case ImageSourceType.memory:
        if (imageData == null) {
          return const Center(child: Text('Image data is required for memory type'));
        }
        imageWidget = Image.memory(
          imageData!,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: errorBuilder,
        );
        break;

      default:
        return const Center(child: Text('Unsupported image source type'));
    }

    return imageWidget;
  }
}
