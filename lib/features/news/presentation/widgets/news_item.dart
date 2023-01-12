import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class NewsItem extends StatelessWidget {
  final String title;
  final String publisherName;
  final String updatedTime;
  final String imageUrl;
  final String publisherIcon;
  final bool wideView;
  final VoidCallback onTap;

  const NewsItem({
    Key? key,
    required this.title,
    required this.publisherName,
    required this.updatedTime,
    required this.imageUrl,
    required this.publisherIcon,
    required this.wideView,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          (wideView) ? _buildWideViewItem(context) : _buildNormalItem(context),
    );
  }

  Widget _buildNormalItem(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: publisherIcon,
                        fit: BoxFit.fitHeight,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      publisherName,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      title,
                      maxLines: 4,
                      style: const TextStyle()
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      updatedTime,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ]),
            )
          ],
        )
      ],
    );
  }

  Widget _buildWideViewItem(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.33,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(title,
              maxLines: 4, style: Theme.of(context).textTheme.headline6),
        ),
        Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: publisherIcon,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                publisherName,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        )
      ],
    );
  }
}
