import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_with_bloc/bloc/random_bloc.dart';
import 'package:flutter_with_bloc/bloc/bloc.dart';
import 'package:flutter_with_bloc/bloc/event/counter_change_event.dart';
import 'package:flutter_with_bloc/bloc/state/counter_change_state.dart';
import 'package:flutter_with_bloc/bloc/state/random_counter_change_state.dart';
import 'package:flutter_with_bloc/bloc/event/random_counter_change_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) => CounterChangeBloc())),
          BlocProvider(create: ((context) => RandomCounterChangeBloc())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showTheSnack(int count) {
    if (count % 3 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Marsbar'), duration: Durations.extralong3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: FlutterLogo(),
              title: Text('Counter'),
              //tilføj onTap:(){ der router til den ønskede side } 
            ),
            ListTile(
              leading: FlutterLogo(),
              title: Text('Random Counter'),
              //tilføj onTap:(){ der router til den ønskede side } 
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _counterWidget(context),
          _randomCounterWidget(context)
          ],
      ),
    );
  }
}


Widget _counterWidget(BuildContext context) {
  return Column(children: <Widget>[
    const Text(
      'You have pushed the button this many times:',
    ),
    BlocBuilder<CounterChangeBloc, CounterChangeState>(
        builder: (context, state) {
      return Text(
        '${state.currentValue}',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterChangeBloc>().add(CounterIncrementEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterChangeBloc>().add(CounterDecrementEvent());
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    ),
  ]);
}


Widget _randomCounterWidget(BuildContext context) {
  return Column(
    children: <Widget>[
      const Text('Your random number is:'),
      BlocBuilder<RandomCounterChangeBloc, RandomCounterChangeState>(
          builder: (context, state) {
        return Text(
          '${state.currentValue}',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      }),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          onPressed: () {
            context
                .read<RandomCounterChangeBloc>()
                .add(RandomCounterBiggerThanEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add_circle),
        ),
        FloatingActionButton(
          onPressed: () {
            context
                .read<RandomCounterChangeBloc>()
                .add(RandomCounterSmallerThanEvent());
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove_circle),
        )
      ]),
    ],
  );
}

