import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithBadge extends StatelessWidget {
  const IconButtonWithBadge({
    Key? key,
    required this.srcSvg,
    this.numOfItem = 0,
    required this.onTap,
  }) : super(key: key);

  final String srcSvg;
  final int numOfItem;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              srcSvg,
            ),
          ),
          if (numOfItem > 0)
            Positioned(
              right: -1,
              top: 4,
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$numOfItem',
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}