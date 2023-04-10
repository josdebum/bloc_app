
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

// Without Bloc
// void main() {
//   runApp(MyApp());
// }
//

//With Bloc
// void main() {
//   Bloc.observer = SimpleBlocObserver();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         brightness: Brightness.dark,
//       ),
//       routes: {
//         HomePage.routeName: (context) => HomePage(),
//         //CartPage.routeName: (context) => CartPage(),
//       },
//       initialRoute: HomePage.routeName,
//    //   home: MyBookings(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

//
// void main() {
//   Bloc.observer = const AppBlocObserver();
//   runApp( MyApp());
// }
//
// /// {@template app_bloc_observer}
// /// Custom [BlocObserver] that observes all bloc and cubit state changes.
// /// {@endtemplate}
// class AppBlocObserver extends BlocObserver {
//   /// {@macro app_bloc_observer}
//   const AppBlocObserver();
//
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) print(change);
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
// }
//
// /// {@template app}
// /// A [StatelessWidget] that:
// /// * uses [bloc](https://pub.dev/packages/bloc) and
// /// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
// /// to manage the state of a counter and the app theme.
// /// {@endtemplate}
// class MyApp extends StatelessWidget {
//   /// {@macro app}
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ThemeCubit(),
//       child: const AppView(),
//     );
//   }
// }
//
// /// {@template app_view}
// /// A [StatelessWidget] that:
// /// * reacts to state changes in the [ThemeCubit]
// /// and updates the theme of the [MaterialApp].
// /// * renders the [CounterPage].
// /// {@endtemplate}
// class AppView extends StatelessWidget {
//   /// {@macro app_view}
//   const AppView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeData>(
//       builder: (_, theme) {
//         return MaterialApp(
//           theme: theme,
//           home: const CounterPage(),
//         );
//       },
//     );
//   }
// }
//
// /// {@template counter_page}
// /// A [StatelessWidget] that:
// /// * provides a [CounterBloc] to the [CounterView].
// /// {@endtemplate}
// class CounterPage extends StatelessWidget {
//   /// {@macro counter_page}
//   const CounterPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterBloc(),
//       child: const CounterView(),
//     );
//   }
// }
//
// /// {@template counter_view}
// /// A [StatelessWidget] that:
// /// * demonstrates how to consume and interact with a [CounterBloc].
// /// {@endtemplate}
// class CounterView extends StatelessWidget {
//   /// {@macro counter_view}
//   const CounterView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: Center(
//         child: BlocBuilder<CounterBloc, int>(
//           builder: (context, count) {
//             return ProductList();
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () {
//               context.read<CounterBloc>().add(CounterIncrementPressed());
//             },
//           ),
//           const SizedBox(height: 4),
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () {
//               context.read<CounterBloc>().add(CounterDecrementPressed());
//             },
//           ),
//           const SizedBox(height: 4),
//           FloatingActionButton(
//             child: const Icon(Icons.brightness_6),
//             onPressed: () {
//               context.read<ThemeCubit>().toggleTheme();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// Event being processed by [CounterBloc].
// abstract class CounterEvent {}
//
//
// class AddProduct extends CounterEvent {
//   final int productIndex;
//
//    AddProduct(this.productIndex);
//
//   @override
//   List<Object> get props => [productIndex];
//
//   @override
//   String toString() => 'AddProduct { index: $productIndex }';
//
//
// }
//
// class RemoveProduct extends CounterEvent {
//   final int productIndex;
//
//    RemoveProduct(this.productIndex);
//
//   @override
//   List<Object> get props => [productIndex];
//
//   @override
//   String toString() => 'RemoveProduct { index: $productIndex }';
// }
//
// /// Notifies bloc to increment state.
// class    CounterIncrementPressed extends CounterEvent {}
//
// /// Notifies bloc to decrement state.
// class CounterDecrementPressed extends CounterEvent {}
//
// /// {@template counter_bloc}
// /// A simple [Bloc] that manages an `int` as its state.
// /// {@endtemplate}
// class CounterBloc extends Bloc<CounterEvent, int> {
//   /// {@macro counter_bloc}
//   CounterBloc() : super(0) {
//     on<CounterIncrementPressed>((event, emit) => emit(state + 1));
//     on<CounterDecrementPressed>((event, emit) => emit(state - 1));
//   }
// }
//
// /// {@template brightness_cubit}
// /// A simple [Cubit] that manages the [ThemeData] as its state.
// /// {@endtemplate}
// class ThemeCubit extends Cubit<ThemeData> {
//   /// {@macro brightness_cubit}
//   ThemeCubit() : super(_lightTheme);
//
//   static final _lightTheme = ThemeData(
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Colors.white,
//     ),
//     brightness: Brightness.light,
//   );
//
//   static final _darkTheme = ThemeData(
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Colors.black,
//     ),
//     brightness: Brightness.dark,
//   );
//
//   /// Toggles the current brightness between light and dark.
//   void toggleTheme() {
//     emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
//   }
// }



import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

const names = [
  'Foo',
  'Bar',
  'Baz',
];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {

  // initial state of the cubit
  NamesCubit() : super(null);

  void pickRandomName() => emit(
    //emit is to produce new elements from bloc or cubit
    names.getRandomElement(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NamesCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
            onPressed: () => cubit.pickRandomName(),
            child: const Text('Pick a random name'),
          );
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data ?? ''),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}