import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/view/splashScreen.dart';
import 'package:test_2026/viewModel/bloc/blocModel.dart';
import 'package:test_2026/viewModel/bloc/colorThemeServices.dart';
import 'package:test_2026/viewModel/bloc/cartBlocModel.dart';
import 'package:test_2026/viewModel/bloc/navigationBlock.dart';

import 'model/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterData>(
          create: (BuildContext context) => CounterData(),
        ),
        BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc()),

        BlocProvider<NavigationBlock>(
            create: (BuildContext context) => NavigationBlock()),

      ],
      child: BlocBuilder<NavigationBlock, NavState>(

        builder: (BuildContext context, state) {
          return ColorThemeServices(
            msg: state.navRoute.toString(),
            bColor: Colors.redAccent,
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              routes: Routes().routeMap,
              initialRoute: SplashScreen.route,
              // home: BlocBuilder<ScreenPosition, ScreenStatus>(
              //
              //     builder: (BuildContext context, data){
              //       if(data == ScreenStatus.splash)
              //       {
              //         Navigator.pushNamed(context, SplashScreen.route);
              //
              //       }
              //       if(data == ScreenStatus.home)
              //       {
              //         Navigator.pushNamed(context, MainScreen.route);
              //       }
              //
              //       return Container();
              //
              //     }),
            ),
          );
        },
      ),
    );
  }
}




