import 'package:flutter/material.dart';
import 'package:jenosize/presentation/restuarant/sections/restaurant_list_fix.dart';

class RestuarantPage extends StatefulWidget {
  const RestuarantPage({super.key});

  @override
  State<RestuarantPage> createState() => _RestuarantPageState();
}

class _RestuarantPageState extends State<RestuarantPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        RestuarantListFix(),
      ],
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       "Restuarant",
    //       style: Theme.of(context).textTheme.displaySmall,
    //     ),
    //     const Icon(
    //       Icons.search,
    //       size: 40,
    //     ),
    //   ],
    // );
  }
}
