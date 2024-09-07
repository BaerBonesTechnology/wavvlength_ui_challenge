
import 'package:flutter/material.dart';

class DismissibleCardList extends StatefulWidget {
  const DismissibleCardList({super.key, required this.children, this.onDismiss});

  final List<String> children;
  final Function(int)? onDismiss;

  @override
  State<DismissibleCardList> createState() => _DismissibleCardListState();
}

class _DismissibleCardListState extends State<DismissibleCardList> {
late List<String> _items;

@override
void initState() {
  super.initState();
  _items = List.from(widget.children);
}

@override
Widget build(BuildContext context) {
  return SizedBox(
    height: 250,
    child: Stack(
      alignment: Alignment.center,
      children: [
        for (int i = _items.length - 1; i >= 0; i--)
          Positioned(
            top: i* 8.0,
            child: Dismissible(
              key: Key(_items[i]), // Unique key for each Dismissible
              onDismissed: (direction) {
                setState(() {
                  _items.removeAt(i);
                  if (widget.onDismiss != null) {
                    widget.onDismiss!(i);
                  }
                });
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                child: Card(
                  child: Center(child: Text(_items[i])),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
}