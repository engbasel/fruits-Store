import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruites_hup/core/utils/app_assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.assetsImagesPlant),
            ],
          ),
          SvgPicture.asset(
            Assets.assetsImagesLogo,
          ),
          SvgPicture.asset(
            Assets.assetsImagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
