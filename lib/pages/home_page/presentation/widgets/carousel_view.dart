import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/pages/home_page/bloc/home_page_bloc.dart';

class CustomCarouselView extends StatefulWidget {
  const CustomCarouselView({super.key});

  @override
  State<CustomCarouselView> createState() => _CustomCarouselViewState();
}

class _CustomCarouselViewState extends State<CustomCarouselView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        switch (state) {
          case HomePageInitialState():
            return CarouselView(
                itemExtent: 300,
                shrinkExtent: 150,
                children: List<Widget>.generate(
                  min(state.productModel?.products?.length ?? 0, 4),
                  (index) {
                    return CustomLayoutCard(
                      images:
                          state.productModel?.products?[index].thumbnail ?? "",
                    );
                  },
                ));
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class CustomLayoutCard extends StatelessWidget {
  const CustomLayoutCard({super.key, required this.images});
  final String images;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) =>
            const Center(child: CircularProgressIndicator()),
        imageUrl: images,
        height: 50,
      ),
    );
  }
}
