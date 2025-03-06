import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2026/model/homeModel.dart';
import 'package:test_2026/view/detailsScreen.dart';

import '../../viewModel/bloc/cartBlocModel.dart';


class GridviewWidget extends StatelessWidget {
  final List<CardModel> listData;
  const GridviewWidget({super.key,required this.listData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listData.length,
        gridDelegate:
        SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:0.8
        ),
        itemBuilder: (context, index){
          CardModel item = listData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, DetailsScreen.route);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.black26)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children:[ Column(
                      children: [
                        item.image!=null ?Expanded(child: Image.network(item.image!)): Container(),
                        SizedBox(
                            height: 40,
                            child: Center(child: Text(item.title))),

                      ],
                    ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: (){
                              context.read<CounterData>().increment(item);

                            },
                            child: Icon(Icons.shopping_cart_outlined)),
                      )
                    ]
                  ),
                )

              ),
            ),
          );
        });
  }
}

