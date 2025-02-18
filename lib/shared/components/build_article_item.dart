
import 'package:flutter/material.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://dims.apnews.com/dims4/default/0326f74/2147483647/strip/true/crop/2998x1686+0+109/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2Ff1%2F89%2F01bca9984397477a3b194409ba48%2F1d86402c1c3b4832bd453699e7e38230"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "title",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "2025-04-02T11:43:00Z",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
