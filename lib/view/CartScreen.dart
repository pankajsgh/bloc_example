import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/model/homeModel.dart';
import 'package:test_2026/view/components/ListViewWidget.dart';
import '../viewModel/bloc/cartBlocModel.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterData, List<CardModel>>(
        builder: (context, count) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Cart"),
              ),
              body: count.isNotEmpty? CartListWidget(listData: count): Center(
          child: Text("Empty Cart"),
          ));
        }
    );
  }
}

