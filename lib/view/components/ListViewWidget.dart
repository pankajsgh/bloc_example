import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/homeModel.dart';
import '../../viewModel/bloc/cartBlocModel.dart';

class ListviewWidget extends StatelessWidget {
  final List<CardModel> listData;
  const ListviewWidget({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listData.length,
        itemBuilder: (context, index){
        var item = listData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    item.image!=null ?Expanded(child: Image.network(item.image!)): Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width-160,
                          child: Text(item.title)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CartListWidget extends StatelessWidget {
  final List<CardModel> listData;
  const CartListWidget({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listData.length,
        itemBuilder: (context, index){
          var item = listData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      item.image!=null ?Expanded(child: Image.network(item.image!)): Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width-160,
                            child: Text(item.title)),
                      ),
                      InkWell(
                          onTap: (){
                            context.read<CounterData>().decrement(item);

                          },
                          child: Icon(Icons.shopping_cart_outlined)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}