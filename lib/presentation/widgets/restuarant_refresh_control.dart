import 'package:flutter/cupertino.dart';
import '../../configs/images.dart';

class RestuarantRefreshControl extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const RestuarantRefreshControl({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => Image(
        image: AppImages.digitloader,
      ),
    );
  }
}
