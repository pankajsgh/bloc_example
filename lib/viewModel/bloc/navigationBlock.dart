
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



abstract class NavEvent extends Equatable{}

class NavigateToHome extends NavEvent {
  NavigateToHome();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class NavigateToDetail extends NavEvent {
  NavigateToDetail();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavState {

  List<String>? navRoute = [];
  NavState({this.navRoute});

  NavState copyWith({List<String>? navRoute }) {
    return NavState(
    navRoute: navRoute ?? this.navRoute,
    );
  }
}

class NavigationBlock extends Bloc<NavEvent, NavState>{
  NavigationBlock() : super(NavState()) {
    on<NavEvent>((event, emit) async {

      if(event==NavigateToHome())
      {
        emit(state.copyWith(navRoute: ["Amit", "Sumit", "Rohan"]));
      }

    });
  }
}