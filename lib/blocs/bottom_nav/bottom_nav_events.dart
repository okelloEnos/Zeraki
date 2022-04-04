import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvents extends Equatable{

  @override
  List<Object?> get props => [];
}

class TappingNavigation extends BottomNavigationEvents{
  final int navIndex;

  TappingNavigation({required this.navIndex});

  @override
  List<Object?> get props => [navIndex];
}