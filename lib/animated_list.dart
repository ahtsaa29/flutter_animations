import 'package:flutter/material.dart';

class AnimList extends StatefulWidget {
  const AnimList({super.key});

  @override
  State<AnimList> createState() => _AnimListState();
}

class _AnimListState extends State<AnimList> {
  final items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    items.insert(0, "Item ${items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _deleteItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.purple,
            child: ListTile(
              title: Text("Deleted"),
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 1,
      ),
    );
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
            Expanded(
                child: AnimatedList(
                    key: _key,
                    initialItemCount: 0,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index, animation) {
                      return SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          color: Colors.orange,
                          child: ListTile(
                            title: Text(
                              items[index],
                            ),
                            trailing: IconButton(
                                onPressed: () => {_deleteItem(index)},
                                icon: const Icon(Icons.delete)),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
