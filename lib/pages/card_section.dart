import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../utils/app_color.dart';

class CardSection extends StatelessWidget {
  final String image;
  final String text;
  final String subText;
  final String gender;
  const CardSection(
      {Key? key,
      required this.image,
      required this.text,
      required this.subText,
      required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.customGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          subText,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 15, right: 20),
                child: Text(
                  gender,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
