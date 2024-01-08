import 'package:damproject/utilities/colors.dart';
import 'package:flutter/material.dart';

class Place {
  final String title;
  final String description;
  final String imageUrl;
  int likeCount;
  List<String> comments;

  Place({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.likeCount = 0,
    this.comments = const [],
  });
}

class VisitPlacesScreen3 extends StatefulWidget {
  @override
  _VisitPlacesScreenState createState() => _VisitPlacesScreenState();
}

class _VisitPlacesScreenState extends State<VisitPlacesScreen3> {
  final List<Place> places = [
    Place(
      title: 'Annaba',
      description: 'Description for Place 1.',
      imageUrl: 'assets/annaba.jpeg',
      comments: ['Nice place!', 'Beautiful view.'],
    ),
    Place(
      title: 'Tizi',
      description: 'Description for Place 2.',
      imageUrl: 'assets/tizi.jpeg',
      comments: ['Amazing!', 'I want to visit.'],
    ),
    Place(
      title: 'Chréa',
      description: 'Description for Place 2.',
      imageUrl: 'assets/chréa.jpeg',
      comments: ['Wow'],
    ),
    Place(
      title: 'Oran',
      description: 'Description for Place 2.',
      imageUrl: 'assets/oran2.jpeg',
      comments: ['Great Place'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Places'),
        backgroundColor: Primaryclr,
      ),
      body: ListView(
        children: places.map((place) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 350.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      place.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        LikeButton(
                          likeCount: place.likeCount,
                          onLiked: () {
                            setState(() {
                              place.likeCount++;
                            });
                          },
                        ),
                        CommentButton(
                          commentCount: place.comments.length,
                          onCommented: () {
                            _showCommentDialog(context, place);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Text(place.description),
                SizedBox(height: 8.0),
                // Display comments below the image
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: place.comments
                      .map((comment) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(comment),
                          ))
                      .toList(),
                ),
                SizedBox(height: 8.0),
                // You can add more widgets here as needed
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _showCommentDialog(BuildContext context, Place place) async {
    String newComment = "";
    newComment = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a Comment'),
        content: TextField(
          onChanged: (value) => newComment = value,
          decoration: InputDecoration(hintText: 'Enter your comment'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, newComment),
            child: Text('Add Comment'),
          ),
        ],
      ),
    );

    if (newComment != null && newComment.isNotEmpty) {
      setState(() {
        place.comments.add(newComment);
      });
    }
  }
}

class LikeButton extends StatefulWidget {
  final int likeCount;
  final VoidCallback onLiked;

  LikeButton({required this.likeCount, required this.onLiked});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
              if (isLiked) {
                widget.onLiked();
              }
            });
          },
        ),
        Text('${widget.likeCount} Likes'),
      ],
    );
  }
}

class CommentButton extends StatelessWidget {
  final int commentCount;
  final VoidCallback onCommented;

  CommentButton({required this.commentCount, required this.onCommented});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.comment),
          onPressed: () {
            onCommented();
          },
        ),
        Text('${commentCount} Comments'),
      ],
    );
  }
}
