import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/view/components/GridViewWidget.dart';
import 'package:test_2026/view/components/ListViewWidget.dart';
import '../network/repository_store.dart';
import '../viewModel/bloc/blocModel.dart';
import '../viewModel/bloc/block_status.dart';
import '../viewModel/bloc/navigationBlock.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    print( context.read<NavigationBlock>().state.navRoute);
    return Scaffold(
      appBar: AppBar(title: Text("Demo App"),),
      body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.appStatus == BlockStatus.initial) {
               context.read<HomeBloc>().add(GetCardData());
            }

            if (state.appStatus == BlockStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if(state.appStatus == BlockStatus.grid){
              if(state.homeCardModel!=null) {
                return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GridviewWidget(listData: state.homeCardModel!.card)
                );
              }
            } else if(state.appStatus == BlockStatus.list){
              if(state.homeCardModel!=null) {
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListviewWidget(listData: state.homeCardModel!.card)
                );
              }
            }

            return Container();
          }
      ),
    );
  }
}
