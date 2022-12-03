import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/constant.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key? key, this.imgSrc}) : super(key: key);

  final String? imgSrc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerImageCommon),
        child: CachedNetworkImage(
          imageUrl: imgSrc ?? "",
          placeholder: (context, url) {
            return const CupertinoActivityIndicator();
          },
          fit: BoxFit.cover,
          cacheKey: imgSrc,
        ),
      ),
    );
  }
}
