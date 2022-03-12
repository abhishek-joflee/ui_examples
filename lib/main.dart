import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400),
          child: SearchBar(),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  final _searchBarKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: _searchBarKey,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.grey),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Material(
              shape: const CircleBorder(),
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => _searchBarKey.currentState!.reset(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
