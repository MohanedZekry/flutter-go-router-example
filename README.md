# flutter-go-router-example

This is an example app showing how to implement bottom navigation with nested routes using [go_router](https://pub.dev/packages/go_router) and [cubit](https://pub.dev/packages/flutter_bloc)

## Requirements ##
- [Cubit](https://pub.dev/packages/flutter_bloc)
- [GoRouter](https://pub.dev/packages/go_router)
- [Equatable](https://pub.dev/packages/equatable)

## Notes ##
This example is built using GoRouter 5.2.4.
Navigating bottom navbar screens with go router.
Instead of using buildBody and currentIndex for routing, we’ll be using go router to navigate between screens.

<p align="center">
  <img alt='Screenshot 1' src="images/GoRouter.png" width="20%"/>  
  <img alt='Screenshot 2' src="images/GoRouter2.png" width="20%"/>  
  <img alt='Screenshot 3' src="images/GoRouter3.png" width="20%"/>
</p>


## Why go_router? ##
Reason being it’s now under the wing of official Flutter packages and not to mention its simplicity and good documentation.

For scenarios like this GoRouter has a new type of route called ShellRoute. ShellRoute is a route that displays a UI shell around the route. You’ll instinctively understand about shellRoute once you view this project.
