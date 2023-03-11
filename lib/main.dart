import 'package:flutter/material.dart';
import 'package:long_process/long_process.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = -1;
  bool _calling = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calling
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _calling = true;
                        });
                        final count =
                            await LongProcess().getWithAsync(_counter);
                        if (context.mounted) {
                          _showSnackBar(context, 'result: $count');
                        }
                      } finally {
                        setState(() {
                          _calling = false;
                        });
                      }
                    },
              child: const Text('call plugin (async)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calling
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _calling = true;
                        });
                        final count = await LongProcess().getWithSync(_counter);
                        if (context.mounted) {
                          _showSnackBar(context, 'result: $count');
                        }
                      } finally {
                        setState(() {
                          _calling = false;
                        });
                      }
                    },
              child: const Text('call plugin (sync)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calling
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _calling = true;
                        });
                        final count = _fibonacci(_counter);
                        if (context.mounted) {
                          _showSnackBar(context, 'result: $count');
                        }
                      } finally {
                        setState(() {
                          _calling = false;
                        });
                      }
                    },
              child: const Text('call Flutter sync process'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  num _fibonacci(num count) {
    if (count == 0 || count == 1) {
      return count;
    }
    return _fibonacci(count - 2) + _fibonacci(count - 1);
  }
}
