import 'package:flutter/material.dart';

class ScrollListView extends StatelessWidget {
  final bool isLoading;
  final bool hasMore;
  final Function fetchMore;
  final List<Widget> items;

  ScrollController _scrollController = new ScrollController();

  ScrollListView(
      {Key key, this.isLoading, this.hasMore, this.fetchMore, this.items})
      : super(key: key);

  @override
  void dispose() {
    _scrollController.dispose();
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.position.maxScrollExtent >
              _scrollController.offset &&
          _scrollController.position.maxScrollExtent -
                  _scrollController.offset <=
              50) {
        if (isLoading) {
          print('loading');
        } else {
          fetchMore();
        }
      }
    }
    return true;
  }

  List<Widget> _generateList(isLoading, hasMore, items) {
    var listWidgets = items;

    var nullDataWidget = !isLoading && items.length <= 0
        ? Container(
            height: 50.0,
            child: Text(
              '没有数据',
              style: TextStyle(fontSize: 14.0, height: 2.0),
            ))
        : Container();

    var loadingWidget = isLoading
        ? Container(
            width: 50.0,
            height: 50.0,
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          )
        : Container();

    var hasMoreWidget = !hasMore && items.length > 0
        ? Container(
            height: 50.0,
            child: Text(
              '没有更多数据',
              style: TextStyle(fontSize: 14.0, height: 2.0),
            ))
        : Container();

    listWidgets.add(nullDataWidget);
    listWidgets.add(loadingWidget);
    listWidgets.add(hasMoreWidget);
    return listWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: NotificationListener(
            onNotification: _onNotification,
            child: SingleChildScrollView(
              child: Column(
                children: _generateList(isLoading, hasMore, items),
              ),
              scrollDirection: Axis.vertical,
              controller: _scrollController,
            ),
          ),
        )
      ],
    );
  }
}
