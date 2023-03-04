# go_router example
The purpose of the go_router package is that it is A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens and reduce complexity, regardless of the platform you're targeting (mobile, web, desktop), You can define URL patterns, navigate using a URL, handle deep links, and a number of other navigation-related scenarios.

This is an example app showing how to implement bottom navigation with nested routes using [go_router](https://pub.dev/packages/go_router) and [cubit](https://pub.dev/packages/flutter_bloc)

## Table of Contents
- [Requirements](#requirements)
- [Intro](#intro)
- [Screenshots](#screenshots)
- [Implementation](#implementation)
- [Why?](#why)

## Requirements
- [cubit](https://pub.dev/packages/flutter_bloc)
- [go_router](https://pub.dev/packages/go_router)
- [equatable](https://pub.dev/packages/equatable)

## Intro
This example is built using go_router 6.2.0.
Navigating bottom navbar screens with go_router.
Instead of using buildBody and currentIndex for routing, we’ll be using go router to navigate between screens.

## Screenshots
<p align="center">
  <img alt='Screenshot 1' src="images/GoRouter.png" width="20%"/>  
  <img alt='Screenshot 2' src="images/GoRouter2.png" width="20%"/>  
  <img alt='Screenshot 3' src="images/GoRouter3.png" width="20%"/>
</p>

## Implementation
To implement bottom navigation with go_router it's not simple or easy, but you can follow this instructions and everything will be just fine.

First we need to configure our routing for navigation we will use `ShellRoute` it displays a UI shell around the route, Follow the implelemenation to understand it.

```dart
class AppRouter {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.homeNamedPage,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MainScreen(screen: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.homeNamedPage,
            pageBuilder: (context, state) =>
            const NoTransitionPage(
              child: HomeScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.homeDetailsNamedPage,
                builder: (context, state) => const HomeDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.profileNamedPage,
            pageBuilder: (context, state) =>
            const NoTransitionPage(
              child: ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.profileDetailsNamedPage,
                builder: (context, state) => const ProfileDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.settingsNamedPage,
            pageBuilder: (context, state) =>
            const NoTransitionPage(
              child: SettingScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
  
  static GoRouter get router => _router;
}
```
*Notes* `ShellRoute` has multiple routes whose returns a widget and that is child attribute to shellRoute builder.


- after that we will implement our Cubit
```dart
class NavigationState extends Equatable {

  final String bottomNavItems;
  final int index;

  const NavigationState({required this.bottomNavItems, required this.index});

  @override
  List<Object> get props => [bottomNavItems, index];
}
```

- we building three screens in the bottom navigation
```dart
enum BottomNavItems {
  home,
  profile,
  settings
}
```

- our Cubit
```dart
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(bottomNavItems: Routes.homeNamedPage, index: 0));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(bottomNavItems: Routes.homeNamedPage,index:  0));
        break;
      case 1:
        emit(const NavigationState(bottomNavItems: Routes.profileNamedPage,index:  1));
        break;
      case 2:
        emit(const NavigationState(bottomNavItems: Routes.settingsNamedPage,index:  2));
        break;
    }
  }
}
```

- simple bottom navigation bar
```dart
BottomNavigationBar(
          onTap: (value) {
            if(state.index != value){
              context.read<NavigationCubit>().getNavBarItem(value);
              context.go(tabs[value].initialLocation);
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            size: ((IconTheme
                .of(mContext)
                .size)! * 1.3),
          ),
          items: tabs,
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
        );
```

## Why?
Reason being it’s now under the wing of official Flutter packages and not to mention its simplicity and good documentation.

For scenarios like this GoRouter has a new type of route called ShellRoute. ShellRoute is a route that displays a UI shell around the route. You’ll instinctively understand about shellRoute once you view this project.
