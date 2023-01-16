import "package:flutter/material.dart";

class CategoryTabBarWidget extends StatefulWidget {
  const CategoryTabBarWidget(
      {Key? key,
      required double height,
      required TabController? categoryTabController,
      required ScrollController? scrollController,
      required List<String> categories,
      required void Function(int) onChangeCategory,
      required ValueNotifier<int> currenTabIndex})
      : _height = height,
        _categoryTabController = categoryTabController,
        _scrollController = scrollController,
        _categories = categories,
        _onChangeCategory = onChangeCategory,
        _currenTabIndex = currenTabIndex,
        super(key: key);
  final double _height;
  final TabController? _categoryTabController;
  final ScrollController? _scrollController;
  final List<String> _categories;
  final void Function(int) _onChangeCategory;
  final ValueNotifier<int> _currenTabIndex;

  @override
  State<CategoryTabBarWidget> createState() => _CategoryTabBarWidgetState();
}

class _CategoryTabBarWidgetState extends State<CategoryTabBarWidget> {
  bool showShadow = false;

  @override
  void initState() {
    if (widget._scrollController != null) {
      widget._scrollController!.addListener(() {
        final offset = widget._scrollController!.offset;
        if (offset > 70 && !showShadow) {
          setState(() {
            showShadow = true;
          });
        } else if (offset <= 70 && showShadow) {
          setState(() {
            showShadow = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._height,
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                      color: Colors.grey.shade500.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 2)
                ]
              : []),
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              isScrollable: true,
              controller: widget._categoryTabController,
              indicatorPadding: EdgeInsets.zero,
              indicatorWeight: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              onTap: (index) => widget._onChangeCategory.call(index),
              tabs: _buildCategoryTabs,
              indicator: const BoxDecoration(color: Colors.white),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              //  dragStartBehavior: DragStartBehavior.down,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _buildCategoryTabs {
    return List.generate(
      widget._categories.length,
      (index) => ValueListenableBuilder<int>(
          valueListenable: widget._currenTabIndex,
          builder: (context, tabIndex, child) {
            final isSelectedTab = index == tabIndex;
            return Chip(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              labelPadding: EdgeInsets.zero,
              backgroundColor: isSelectedTab
                  ? Colors.blueAccent.shade400
                  : Colors.blue.shade50,
              label: Text(
                widget._categories[index],
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: isSelectedTab ? Colors.white : Colors.grey.shade900,
                    fontWeight: isSelectedTab ? FontWeight.w600 : null),
              ),
            );
          }),
    );
  }
}
