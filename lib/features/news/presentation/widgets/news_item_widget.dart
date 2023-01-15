import "package:flutter/material.dart";
import "package:lumi_assignment/core/presentation/widgets/custom_cache_network_image.dart";

class NewsItemWidget extends StatelessWidget {
  final String title;
  final String publisherName;
  final String updatedTime;
  final String imageUrl;
  final String publisherIcon;
  final bool wideView;
  final VoidCallback onTap;

  const NewsItemWidget({
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
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomCachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fitHeight,
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomCachedNetworkImage(
                        imageUrl: publisherIcon,
                        fit: BoxFit.fitHeight,
                        height: 24,
                        width: 24,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1, 1),
                              blurRadius: 3)
                        ]),
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
          aspectRatio: 1.5,
          child: CustomCachedNetworkImage(
              imageUrl: imageUrl,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(title,
              maxLines: 4, style: Theme.of(context).textTheme.headline6),
        ),
        Row(
          children: [
            CustomCachedNetworkImage(
                imageUrl: publisherIcon,
                height: 32,
                width: 32,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 2)
                ]),
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
