import 'package:flutter/material.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class CircleImageView extends StatelessWidget {
  final String imgUrl;
  final double? radius;
  final String? errorImage;
  final Color? backgroundColor;

  const CircleImageView(
      {Key? key,
      required this.imgUrl,
      this.radius,
      this.errorImage,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: backgroundColor ?? AppColors.kcGrey,
        radius: radius ?? 30,
        child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipOval(
                child: SizedBox.fromSize(
                    size: const Size.fromRadius(40),
                    // Image radius
                    child: Image.network(imgUrl,
                        errorBuilder: (context, url, error) =>
                            Image.asset(errorImage ?? AppAssets.defaultAvatar),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.kcWhite,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null));
                        },
                        fit: BoxFit.cover)))));
  }
}
