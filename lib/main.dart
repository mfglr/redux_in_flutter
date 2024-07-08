import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_in_flutter/actions.dart';
import 'package:redux_in_flutter/app_state.dart';
import 'package:redux_in_flutter/item_filter.dart';
import 'package:redux_in_flutter/store.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redux in Flutter"),
      ),
      body: StoreProvider(
        store: store,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: (){
                  store.dispatch(const LoadItemsAction());
                },
                child: const Text("load items")
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      store.dispatch(const ChangeFilterTypeAction(itemFilter: ItemFilter.all));
                    }, 
                    child: const Text("All Items")
                  ),
                  OutlinedButton(
                    onPressed: (){
                      store.dispatch(const ChangeFilterTypeAction(itemFilter: ItemFilter.shortText));
                    }, 
                    child: const Text("Short Items")
                  ),
                  OutlinedButton(
                    onPressed: (){
                      store.dispatch(const ChangeFilterTypeAction(itemFilter: ItemFilter.longText));
                    }, 
                    child: const Text("Long Items")
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type an item"
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: OutlinedButton(
                        onPressed: (){
                          store.dispatch(AddItemAction(item: _controller.text));
                          _controller.clear();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("add"),
                            Icon(Icons.add)
                          ],
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: OutlinedButton(
                        onPressed: (){
                          store.dispatch(RemoveItemAction(item: _controller.text));
                          _controller.clear();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("remove"),
                            Icon(Icons.remove)
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              ),
              StoreConnector<AppState,List<String>>(
                converter: (store) => store.state.filteredItems,
                builder: (contex,items) => Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index) {
                      return Text(items[index]);
                    }
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
