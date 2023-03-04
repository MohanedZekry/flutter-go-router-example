# go_router example
The purpose of the go_router package is to use declarative routes to reduce complexity, regardless of the platform you're targeting (mobile, web, desktop), handle deep and dynamic linking from Android, iOS and the web, along with a number of other navigation-related scenarios, while still (hopefully) providing an easy-to-use developer experience.

This is an example app showing how to implement bottom navigation with nested routes using [go_router](https://pub.dev/packages/go_router) and [cubit](https://pub.dev/packages/flutter_bloc)

## Table of Contents
- [Requirements](#requirements)
- [Intro](#intro)
- [Screenshots](#screenshots)
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


## Why?
Reason being it’s now under the wing of official Flutter packages and not to mention its simplicity and good documentation.

For scenarios like this GoRouter has a new type of route called ShellRoute. ShellRoute is a route that displays a UI shell around the route. You’ll instinctively understand about shellRoute once you view this project.
