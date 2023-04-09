// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jenosize/application/get/wrapper/main_wrapper_controller.dart';
// import 'package:jenosize/presentation/home/home.dart';
// import 'package:jenosize/presentation/maps/maps.dart';
// import 'package:jenosize/presentation/restuarant/restuarant.dart';
// import 'package:jenosize/utils/color.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// class MainWrapper extends StatelessWidget {
//   MainWrapper({super.key});

//   final MainWrapperController controller = Get.find<MainWrapperController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   actions: [
//       //     Obx(
//       //       () => Switch.adaptive(
//       //         value: controller.isDarkTheme.value,
//       //         onChanged: (newVal) {
//       //           controller.isDarkTheme.value = newVal;
//       //           controller.switchTheme(
//       //             newVal ? ThemeMode.dark : ThemeMode.light,
//       //           );
//       //         },
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       body: PageView(
//         controller: controller.pageController,
//         onPageChanged: controller.animateToTab,
//         physics: const BouncingScrollPhysics(),
//         children: const [
//           HomePage(),
//           RestuarantPage(),
//           JenosizeMaps(),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         notchMargin: 10,
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 35,
//             vertical: 15,
//           ),
//           child: Obx(
//             () => Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _bottomAppbarItems(
//                   context,
//                   icon: Icons.home,
//                   page: 0,
//                   label: 'หน้าหลัก',
//                 ),
//                 _bottomAppbarItems(
//                   context,
//                   icon: Icons.search,
//                   page: 1,
//                   label: 'ร้านอาหาร',
//                 ),
//                 _bottomAppbarItems(
//                   context,
//                   icon: Icons.location_on,
//                   page: 2,
//                   label: 'แผนที่',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _bottomAppbarItems(
//     BuildContext context, {
//     required icon,
//     required page,
//     required label,
//   }) {
//     return ZoomTapAnimation(
//       onTap: () => controller.gotoTab(page),
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               color: controller.currentPage.value == page
//                   ? ColorConstants.appColors
//                   : Colors.grey,
//               size: 32,
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 color: controller.currentPage == page
//                     ? ColorConstants.appColors
//                     : Colors.grey,
//                 fontSize: 13,
//                 fontWeight:
//                     controller.currentPage == page ? FontWeight.w600 : null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
