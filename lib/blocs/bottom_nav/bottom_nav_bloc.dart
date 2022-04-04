import 'package:bloc/bloc.dart';
import 'package:communication/blocs/bottom_nav/bottom_nav_events.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvents, int>{
  BottomNavigationBloc() : super(0) {
    on<TappingNavigation>(onTappingBottomNavigation);
  }
  void onTappingBottomNavigation(BottomNavigationEvents event, Emitter<int> emit){
    if(event is TappingNavigation){
      final int currentTabIndex = event.navIndex;
      emit(currentTabIndex);
    }
  }
}