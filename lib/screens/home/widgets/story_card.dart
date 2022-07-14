import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/app_colors.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.story,
    this.isAddStory = false,
  }) : super(key: key);

  final Story story;
  final bool isAddStory;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.network(
            isAddStory ? story.user.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: const BoxDecoration(
              gradient: storyGradient,
            ),
          ),
          Positioned(
            top: 3,
            left: 3,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: theme.primaryColor,
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(story.user.imageUrl),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            left: 8,
            child: Text(
              isAddStory ? 'Tạo tin' : story.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}