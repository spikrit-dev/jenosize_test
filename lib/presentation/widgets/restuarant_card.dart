import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:jenosize/presentation/widgets/restuarant_image.dart';
import '../../configs/images.dart';

class RestuarantCard extends StatelessWidget {
  static const double _jenoFraction = 0.75;
  static const double _restauFraction = 0.76;

  final Restuarant restuarant;
  final void Function()? onPress;

  const RestuarantCard(
    this.restuarant, {
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            // color: restuarant.color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                // color: restuarant.color.withOpacity(0.4),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              // color: restuarant.color,
              child: InkWell(
                // onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildJenoSizeDecoration(height: itemHeight),
                    _buildRestuarant(height: itemHeight),
                    _buildRestuarantNumber(),
                    _CardContent(restuarant),
                    _buildRestuarantSegment(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildJenoSizeDecoration({required double height}) {
    final jenoSize = height * _jenoFraction;

    return Positioned(
      bottom: -height * 0.13,
      left: -height * 0.03,
      child: Image(
        image: AppImages.jenosizeic,
        width: jenoSize,
        height: jenoSize,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildRestuarant({required double height}) {
    final restuarantSize = height * _restauFraction;

    return Positioned(
      // bottom: -2,
      top: 13,
      left: 12,
      child: RestuarantImage(
        size: Size.square(restuarantSize),
        restuarant: restuarant,
      ),
    );
  }

  Widget _buildRestuarantNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        'Rank: ${restuarant.rank.toString()}',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(135, 114, 111, 111),
        ),
      ),
    );
  }

  Widget _buildRestuarantSegment() {
    return Positioned(
      // top: 65,
      // right: 30,
      left: 120,
      bottom: 30,
      child: Text(
        restuarant.segmentCategory.toString(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(135, 114, 111, 111),
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Restuarant restuarant;

  const _CardContent(this.restuarant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 120,
      bottom: 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Hero(
            tag: restuarant.rank + restuarant.sales,
            child: AutoSizeText(
              restuarant.restuarant,
              style: TextStyle(
                fontSize: 18,
                height: 0.7,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 10),
          // ..._buildTypes(context),
        ],
      ),
    );
  }

  // List<Widget> _buildTypes(BuildContext context) {
  //   return pokemon.types
  //       .take(2)
  //       .map(
  //         (type) => Padding(
  //           padding: EdgeInsets.only(bottom: 6),
  //           child: PokemonType(type),
  //         ),
  //       )
  //       .toList();
  // }
}
