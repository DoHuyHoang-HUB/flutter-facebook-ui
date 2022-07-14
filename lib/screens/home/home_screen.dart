import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/app_colors.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/screens/home/widgets/story_card.dart';
import 'package:flutter_facebook_responsive_ui/widgets/icon_button_with_badge.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          buildAppBar(theme),
        ],
        body: Column(
          children: [
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.png',
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Bạn đang nghĩ gì?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        labelColor: theme.primaryColor,
                        unselectedLabelColor: Colors.black54,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            text: 'Tin',
                          ),
                          Tab(
                            text: 'Reels',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 200,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFF2F2F2), Colors.white])),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      clipBehavior: Clip.none,
                      child: Row(
                        children: [
                          ...List.generate(
                            stories.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: StoryCard(story: stories[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar buildAppBar(ThemeData theme) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Text(
        'facebook',
        style: TextStyle(
          color: theme.primaryColor,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      floating: true,
      centerTitle: false,
      actions: [
        IconButtonWithBadge(
          srcSvg: 'assets/icons/search.svg',
          onTap: () {},
        ),
        const SizedBox(width: 8),
        IconButtonWithBadge(
          srcSvg: 'assets/icons/messenger.svg',
          numOfItem: 4,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}


