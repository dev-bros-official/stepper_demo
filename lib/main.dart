import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _step(int stepIndex) {
    setState(() {
      _counter = stepIndex;
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
            Stepper(
              currentStep: _counter,
              onStepContinue: () {
                _step(_counter + 1);
              },
              onStepCancel: () {
                _step(_counter - 1);
              },
              onStepTapped: (value) {
                _step(value);
              },
              steps: [
                Step(
                  content: Text('complete'),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  isActive: false,
                  state: StepState.complete,
                ),
                Step(
                  content: Text('disabled'),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  isActive: false,
                  state: StepState.disabled,
                ),
                Step(
                  content: Text('editing'),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  isActive: false,
                  state: StepState.editing,
                ),
                Step(
                  content: Text('error'),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  isActive: false,
                  state: StepState.error,
                ),
                Step(
                  content: Text('indexed'),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  isActive: false,
                  state: StepState.indexed,
                ),
              ],
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _step(_counter + 1),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
