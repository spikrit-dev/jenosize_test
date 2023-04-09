import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/theme/theme_cubit.dart';
import '../../configs/colors.dart';
import '../../configs/images.dart';
import 'main_app_bar.dart';

class JenosizeBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const JenosizeBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final jenoSize = MediaQuery.of(context).size.width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;

    final jenosizeTopMargin = -(jenoSize / 2 - safeAreaTop - appBarHeight / 2);
    final jenosizeRightMargin =
        -(jenoSize / 2 - iconButtonPadding - iconSize / 2);

    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: jenosizeTopMargin,
            right: jenosizeRightMargin,
            child: Opacity(
              opacity: 0.03,
              child: Image(
                image: AppImages.jenosizeic,
                width: jenoSize,
                height: jenoSize,

                // color: !isDark
                //     ? AppColors.whiteGrey
                //     : Colors.black.withOpacity(0.05),
              ),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
