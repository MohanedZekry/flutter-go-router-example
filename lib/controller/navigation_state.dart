part of 'navigation_cubit.dart';

class NavigationState extends Equatable {

  final String bottomNavItems;
  final int index;

  const NavigationState({required this.bottomNavItems, required this.index});

  @override
  List<Object> get props => [bottomNavItems, index];
}
