import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/application/restaurant/restuarant_bloc.dart';
import 'package:jenosize/application/restaurant/restuarant_selector.dart';
import 'package:jenosize/configs/images.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:jenosize/presentation/widgets/main_app_bar.dart';
import 'package:jenosize/presentation/widgets/restuarant_card.dart';
import 'package:jenosize/presentation/widgets/restuarant_refresh_control.dart';
import 'package:jenosize/route.dart';

class RestuarantList extends StatefulWidget {
  const RestuarantList({super.key});

  @override
  RestuarantListState createState() => RestuarantListState();
}

class RestuarantListState extends State<RestuarantList> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  RestuarantBloc get restuarantBloc => context.read<RestuarantBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      restuarantBloc.add(const RestuarantLoadStarted());
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached =
        innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      // Load more!
      restuarantBloc.add(const RestuarantLoadStarted());
    }
  }

  Future _onRefresh() async {
    restuarantBloc.add(const RestuarantLoadStarted());

    return restuarantBloc.stream
        .firstWhere((e) => e.status != RestuarantStateStatus.loading);
  }

  void _onRestuarantPress(Restuarant restuarant) {
    restuarantBloc
        .add(RestuarantSelectChanged(restorantId: restuarant.restuarant));

    AppNavigator.push(Routes.search, restuarant);
    // AppNavigator.push(Routes.searchInfo, restuarant);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: (_, __) => [
        MainSliverAppBar(
          context: context,
        ),
      ],
      body: RestuarantStateStatusSelector((status) {
        switch (status) {
          case RestuarantStateStatus.loading:
            return _buildLoading();

          case RestuarantStateStatus.loadSuccess:
          case RestuarantStateStatus.loadMoreSuccess:
          case RestuarantStateStatus.loadingMore:
            return _buildGrid();

          case RestuarantStateStatus.loadFailure:
          case RestuarantStateStatus.loadMoreFailure:
            return _buildError();

          default:
            return Container();
        }
      }),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Image(image: AppImages.digitloader),
    );
  }

  Widget _buildGrid() {
    return CustomScrollView(
      slivers: [
        RestuarantRefreshControl(onRefresh: _onRefresh),
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: NumberOfRestuarantsSelector((numberOfRestuarants) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return RestuarantSelector(index, (restuarant, _) {
                    return RestuarantCard(
                      restuarant,
                      onPress: () => _onRestuarantPress(restuarant),
                    );
                  });
                },
                childCount: numberOfRestuarants,
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: RestuarantCanLoadMoreSelector((canLoadMore) {
            if (!canLoadMore) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
              child: const Image(image: AppImages.digitloader),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildError() {
    return CustomScrollView(
      slivers: [
        RestuarantRefreshControl(onRefresh: _onRefresh),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.only(bottom: 28),
            alignment: Alignment.center,
            child: const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}
