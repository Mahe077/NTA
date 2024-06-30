import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.isInGrid,
    super.key,
  });

  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          border: Border.all(color: primary),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.5),
              offset: const Offset(4, 4),
            )
          ]),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Title example bigger",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: grey900),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: grey100),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  child: const Text(
                    "First chip",
                    style: TextStyle(
                      fontSize: 12,
                      color: grey700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (isInGrid)
            const Expanded(
                child: Text(
              "Content",
              style: TextStyle(color: grey700),
            ))
          else
            const Text(
              "Content is much much bigger than in grid content so had to define max line to reduce in to fewer lines to corpse the the list view becomes a grid view like UI",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: grey700),
            ),
          const Row(
            children: [
              Text(
                "02 Nov, 2023",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: grey500),
              ),
              Spacer(),
              Icon(
                Icons.delete,
                color: grey500,
                size: 18,
              )
            ],
          )
        ],
      ),
    );
  }
}
