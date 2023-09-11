import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter_app/Modal/Chat_user_data.dart';

import 'ChatScreen.dart';

class Cards extends StatefulWidget {
  final ChatUser user;

  const Cards({super.key, required this.user});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 3,
        child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(
                            user: widget.user,
                          )));
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                width: 35,
                height: 35,
                fit: BoxFit.cover,
                imageUrl: widget.user.image,
                errorWidget: (context, url, error) =>
                    const CircleAvatar(child: Icon(Icons.error)),
              ),
            ),
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.about,
              maxLines: 1,
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 10,
                height: 10,
                color: Colors.green,
              ),
            )),
      ),
    );
  }
}
