import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/view/components/ListViewWidget.dart';

import '../model/homeModel.dart';
import '../network/repository_store.dart';
import '../viewModel/bloc/cartBlocModel.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterData, List<CardModel>>(
        builder: (context, count) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Category"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        child: Text("Man"),
                      ),
                      Tab(
                        child: Text("Electronics"),                      ),
                      Tab(
                        child: Text("Jewelery"),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  FutureBuilderWidget(cat: "men's clothing"),
                  FutureBuilderWidget(cat: "electronics",),
                  FutureBuilderWidget(cat: "jewelery",)
                ])),
          );
        }
    );
  }
}

class FutureBuilderWidget extends StatelessWidget {
  final String cat;
  FutureBuilderWidget({super.key, required this.cat});
  final  homeService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: homeService.getHomeCategoryCard(cat),
        builder: (BuildContext context, AsyncSnapshot<HomeCardModel?> snapshot){
          if(snapshot.hasData)
          {
            if(snapshot.data!=null)
            {
              return ListviewWidget(listData: snapshot.data!.card);
            }
          }
          if(snapshot.hasError)
          {
            Center(child: Text("error"),);
          }
          return
            Center(child: CircularProgressIndicator());
  });
}
}