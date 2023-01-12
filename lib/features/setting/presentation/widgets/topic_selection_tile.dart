import "package:flutter/material.dart";

class TopicSelectionTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  const TopicSelectionTile({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade600 : Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.check_circle),
                )),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
