import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool _isShowEmoji = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Impeller issue'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _isShowEmoji = !_isShowEmoji;
                  });
                },
                icon: const Icon(Icons.change_circle_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (_isShowEmoji)
                const Text('This emoji is affecting the text below: 🥇'),
              CupertinoListSection(
                children: [
                  for (var i = 0; i < 20; i++)
                    CupertinoListTile(
                      title: Text('Tile #$i'),
                    )
                ],
              ),
            ],
          ),
        ),
      );
}
