import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/configs/images.dart';

import '../../../application/theme/theme_cubit.dart';
import '../../../domain/entities/category.dart';
import '../../../infrastructure/categories.dart';
import '../../../route.dart';
import '../../widgets/jenosize_background.dart';
import '../widgets/category_card.dart';

class HeaderCardContent extends StatelessWidget {
  static const double height = 582;

  const HeaderCardContent({super.key});

  void _onSelectCategory(Category category) {
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        // border: Border(
        //   bottom: BorderSide(
        //     color: Colors.white,
        //   ),
        // ),
      ),
      child: JenosizeBackground(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      // Function to toggle theme
                      themeCubit.toggleTheme();
                    },
                    padding: const EdgeInsets.only(
                      left: 28,
                    ),
                    icon: Icon(
                      isDark
                          ? Icons.wb_sunny_outlined
                          : Icons.dark_mode_outlined,
                      color: isDark ? Colors.yellow : Colors.black,
                      size: 25,
                    )),
              ),
            ),
            _logo(),
            _buildTitle(),
            // const SearchBar(),
            _buildCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 230,
      height: 230,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 12,
          ),
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AppImages.jenosizeLg,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(28),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'สำหรับแบบทดสอบของ Jenosize',
          style: TextStyle(
            fontSize: 30,
            height: 1.6,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 62),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
        mainAxisSpacing: 15,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories[index],
          onPress: () => _onSelectCategory(categories[index]),
        );
      },
    );
  }
}
