import 'package:flutter/material.dart';

import 'v_error.dart';
import 'vloading.dart';


/// hiển thị các trạng thái khi: Loading, Error/reload, No data
class LoadingContainer<T> extends StatefulWidget {
  final Widget Function(T data) builderChild;
  final Future<T> Function() getFuture;
  final bool usingForSliver;

  final EdgeInsetsGeometry padding;
  final double? sizeProgressIndicator;
  final bool? isNotShowTextLoading;

  const LoadingContainer({
    Key? key,
    required this.builderChild,
    required this.getFuture,
    required this.usingForSliver,
    this.sizeProgressIndicator,
    this.isNotShowTextLoading,
    this.padding = const EdgeInsets.only(top: 30),
  }) : super(key: key);

  @override
  State<LoadingContainer<T>> createState() => _LoadingContainerState<T>();
}

class _LoadingContainerState<T> extends State<LoadingContainer<T>> {
  late Future<T> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = loadData();
  }

  Future<T> loadData() {
    // await Future.delayed(const Duration(seconds: 1));
    return widget.getFuture();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return widget.builderChild(snapshot.data as T);
        }

        if (snapshot.connectionState != ConnectionState.done) {
          var child = SafeArea(
              child: VLoading(
            padding: widget.padding,
            isNotShowTextLoading: widget.isNotShowTextLoading,
            sizeProgressIndicator: widget.sizeProgressIndicator,
          ));
          return wrapChildWithSliverState(child);
        }
        if (snapshot.hasError) {
          var child = SafeArea(
            child: VError(
              padding: widget.padding,
              error: snapshot.error,
              reload: () {
                debugPrint("reload ");
                setState(() {
                  dataFuture = loadData();
                });
              },
            ),
          );
          return wrapChildWithSliverState(child);
        }
        return wrapChildWithSliverState(const Center(
          child: Text('NO DATA'),
        ));
      },
      future: dataFuture,
    );
  }

  Widget wrapChildWithSliverState(Widget child) {
    return widget.usingForSliver ? SliverToBoxAdapter(child: child) : child;
  }
}
