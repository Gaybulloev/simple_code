import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.gender,
    required this.location,
    required this.originLocation,
  }) : super(key: key);

  final String image;
  final String name;
  final String gender;
  final String location;
  final String originLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonSection(
              name: name,
              image: image,
            ),
            const SizedBox(
              height: 35,
            ),
            Sections(
              title: "Gender",
              text: gender,
            ),
            Sections(
              title: "Location",
              text: location,
            ),
            Sections(
              title: "Origin location",
              text: originLocation,
            )
          ],
        ),
      ),
    );
  }
}

class Sections extends StatelessWidget {
  final String text;
  final String title;

  const Sections({Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.white60,
          )
        ],
      ),
    );
  }
}

class PersonSection extends StatelessWidget {
  final String image;
  final String name;
  const PersonSection({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    color: AppColors.customGreen,
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
