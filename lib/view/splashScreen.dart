import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2026/view/mainScreen.dart';
import 'package:test_2026/viewModel/bloc/navigationBlock.dart';
import '../viewModel/InharitedServices/ChangeNotifierServices.dart';
import '../viewModel/bloc/colorThemeServices.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "/splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(

            children: [
              SizedBox(height: 120,),
              Expanded(child: Text(ColorThemeServices.of(context).msg)),
              Expanded(
                child: Center(
                    child:InkWell(
                      onTap: (){
                        context.read<NavigationBlock>().add(NavigateToHome());
                        Navigator.pushReplacementNamed(context, MainScreen.route);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.redAccent
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Go To home", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )),
              )
            ],
        ),

      ),

    );
  }
}
