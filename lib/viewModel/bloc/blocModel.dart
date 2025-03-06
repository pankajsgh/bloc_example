import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/homeModel.dart';
import '../../network/repository_store.dart';
import 'block_status.dart';

abstract class HomeEvent extends Equatable {}

class GetCardData extends HomeEvent {
  GetCardData();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetListData extends HomeEvent {
  GetListData();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeState extends Equatable {
  const HomeState({this.homeCardModel, this.appStatus = BlockStatus.initial});

  final HomeCardModel? homeCardModel;
  final BlockStatus appStatus;

  HomeState copyWith(
      {HomeCardModel? homeCardModel, BlockStatus? appStatus}) {
    return HomeState(
      homeCardModel: homeCardModel ?? this.homeCardModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [homeCardModel, appStatus];
}


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {

      if(event==GetCardData())
        {
          await mapEventToState(event, emit);
        }
      if(event==GetListData())
      {
        await mapEventToState2(event, emit);
      }

    });
  }

  Future mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    {
      emit(state.copyWith(appStatus: BlockStatus.loading));
      try {
        var data = await ApiService().getHomeCard();
        emit(state.copyWith(appStatus:  BlockStatus.grid));
        emit(state.copyWith(homeCardModel: data));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(state.copyWith(appStatus: BlockStatus.list));
      }
    }
  }

  Future mapEventToState2(HomeEvent event, Emitter<HomeState> emit) async {
    {
      emit(state.copyWith(appStatus: BlockStatus.loading));
      try {
        var data = await ApiService().getHomeCategoryCard("jewelery");
        emit(state.copyWith(appStatus:  BlockStatus.list));
        emit(state.copyWith(homeCardModel: data));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(state.copyWith(appStatus: BlockStatus.failed));
      }
    }
  }
}


