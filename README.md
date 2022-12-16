## Flutter GoRoute ##

This is an example app showing how to implement bottom navigation with nested routes using [GoRouter](https://pub.dev/packages/go_router)

# Notes
This example is built using GoRouter 5.2.4.

Navigating bottom navbar screens with go router.
Instead of using buildBodyand currentIndexfor routing, we’ll be using go router to navigate between screens.

Why go router? reason being it’s now under the wing of official Flutter packages and not to mention its simplicity and good documentation.

For scenarios like this go router has a new type of route called ShellRoute. ShellRoute is a route that displays a UI shell around the route. You’ll instinctively understand about shellRoute once we do the implementation.
