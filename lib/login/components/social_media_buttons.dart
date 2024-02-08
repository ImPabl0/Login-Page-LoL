import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMedia socialMedia;
  const SocialMediaButton({
    required this.socialMedia,
    super.key,
  });

  final Map<SocialMedia, Color> baseColor = const {
    SocialMedia.facebook: Color(0xFF1877f2),
    SocialMedia.google: Color(0xFFffffff),
    SocialMedia.apple: Color(0xFF000000),
    SocialMedia.xbox: Color(0xFF107c10),
  };

  final Map<SocialMedia, Color> borderColor = const {
    SocialMedia.google: Color(0xFFf2f2f2),
  };

  final Map<SocialMedia, String> baseSvgPath = const {
    SocialMedia.facebook: "assets/svgs/facebook_icon.svg",
    SocialMedia.google: "assets/svgs/google_icon.svg",
    SocialMedia.apple: "assets/svgs/apple_icon.svg",
    SocialMedia.xbox: "assets/svgs/xbox_icon.svg",
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              color: borderColor[socialMedia] ?? Colors.transparent, width: 2),
          color: baseColor[socialMedia],
        ),
        child: SizedBox(
          height: 17,
          width: 17,
          child: SvgPicture.asset(
            baseSvgPath[socialMedia]!,
          ),
        ),
      ),
    );
  }
}

enum SocialMedia { facebook, google, apple, xbox }
