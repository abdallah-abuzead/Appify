# This branch is still under development


# Appify Project


## ✨ Description
Appify project created in Flutter using Cubit and Bloc. Appify supports both Android and iOS platforms.
It introduces services for cars, like internal wash, external wash, chemical wash, and so on.
It lists all the nearest workshops to your current location.

## Getting Started

Appify contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants, and required dependencies to create a new project. By using boilerplate code as a standard initializer, we can have the same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use the same code pattern and avoid re-writing from scratch.

## 📱 Screenshots of the application

<div>
    <img src="https://github.com/user-attachments/assets/df5dde45-c0c9-4af6-b220-8da86c897dc0" width="30%">
    <img src="https://github.com/user-attachments/assets/e260fb59-4203-4812-b340-d0c4677de501" width="30%">
    <img src="https://github.com/user-attachments/assets/025ccd2d-3ca9-4d0d-9f33-8f46eecb883c" width="30%">
    <img src="https://github.com/user-attachments/assets/8cf9bd7b-e282-4a1e-bc49-baef28794dc3" width="30%">
    <img src="https://github.com/user-attachments/assets/354ba941-b928-4588-9dc2-8a53efd79d22" width="30%">
</div>

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/abdallah-abuzead/Appify
```

**Step 2:**

Go to the project root and execute the following command in the console to get the required dependencies:

```
flutter pub get 
```

## Appify Features:

* Splash
* Login
* Home
* Workshops
* Reservations
* Routing
* Theme
* Dio
* Cubit (to connect the reactive data of your application with the UI)
* Bloc (State Management)
* Dependency Injection
* Validation
* Error Handling

### Up-Coming Features:

* Authentication
* Caching data
* Pagination
* Settings

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Cubit](https://github.com/felangel/bloc) (to connect the reactive data of your application with the UI)
* [Bloc](https://github.com/felangel/bloc) (State Management)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)
* [dartz](https://github.com/spebbe/dartz) (Functional programming)

### 📄 Folder Structure
Here is the core folder structure that Flutter provides.

```
flutter-app/
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

```
assets/
├── fonts/
├── icons/
├── images/
├── languages/
└── lottie/
```

## 🌴 Folders tree
Here is the folder structure we have been using in this project

```
lib/
├── core/
├── modules/
└── main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
core/
├── app/
│   ├── app_initializer.dart
│   ├── app_root_provider.dart
│   └── my_app.dart
├── app_injections/
│   └── app_injections.dart
├── app_locale/
│   └── app_locale.dart
├── app_router/
│   └── app_router.dart
├── app_themes/
│   └── app_themes.dart
├── bloc_observer/
│   └── bloc_observer.dart 
├── constants/
│   ├── assets/
│   │   ├── app_icons.dart
│   │   └── app_images.dart
│   ├── app_colors.dart  
│   ├── app_constants.dart  
│   ├── app_strings.dart  
│   └── app_url.dart 
├── errors/
│   ├── exceptions.dart
│   ├── failure_message.dart
│   └── failures.dart
├── network/
│   ├── api_handler.dart
│   ├── api_helper.dart
│   ├── dio_interceptor.dart
│   └── network_checker.dart
├── screens/
│   ├── bottom_nav_screen.dart 
│   └── splash_screen.dart
├── utils/
│   ├── caching_sevices/
│   │   └── shared_preferences_services.dart
│   ├── extensions/
│   │   ├── date_time_extensions.dart
│   │   ├── math_extensions.dart
│   │   ├── on_tap_extension.dart
│   │   ├── size_extensions.dart
│   │   ├── string_extensions.dart
│   ├── validation/
│   │   ├── validation_error.dart
│   │   └── validator.dart
│   ├── app_date_utils.dart
│   ├── app_functions.dart
│   └── debouncer.dart
└── widgets
    ├── app_input_fields/
    │   ├── app_rounded_text_field.dart
    │   └── input_label.dart
    ├── cookbooks/
    │   ├── loading_dialog.dart
    │   ├── loading_progress.dart
    │   ├── loading_widget.dart
    │   ├── snackbar_message.dart
    │   └── toast.dart
    ├── dialogs/
    │   └── app_dialog.dart
    ├── errors/
    │   ├── empty_widget.dart
    │   ├── offline_widget.dart
    │   ├── server_error_widget.dart
    │   └── unauthorized_widget.dart
    ├── app_button.dart
    ├── app_drop_down_menu.dart
    ├── app_text.dart
    ├── change_language_widget.dart
    ├── circle_cached_network_image.dart
    ├── custom_app_bar.dart
    ├── custom_auto_size_text.dart
    └── rounded_cached_network_image.dart
           
```

```
1- app - Contains all needed initializations of services and settings for the app. 
2- app_injections - includes all injected instances used in the app. 
3- app_locale - Contains all app-supported locals, and switches between them. 
4- app_router — This file contains all the navigation methods for your application, and it uses Get routing.
5- constants - All the application-level constants are defined in this directory within their respective files. This directory contains the constants for `icons paths`, `images paths`, `colors` `API endpoints`, `preferences`, and `strings`.
6- errors - Contains all exceptions and failures in the app.
7- network - Contains the dio instance configurations, request header, token handling, network checker, and response and error handling.
8- screens — Contains the unmodulated/common screens of your application.
9- utils — Contains the utilities/common functions, and extensions of your application.
10- widgets — Contains the common widgets for your applications. For example, Button, TextField, etc.
```

Here is the module folder structure I have been using for this project.
Each module has the same structure and layers, so I'll explain one module and the other modules are the same.

```
modules/
├── auth/
├── home/
├── reservations/
│   ├── data/
│   │   ├── data_sources/
│   │   │   └── reservations_remote_data_source.dart
│   │   ├── models/
│   │   │   └── reservation.dart
│   │   └── repositories/
│   │       └── reservations_repository.dart
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── use_cases/
│   └── presentation/
│       ├── cubits/
│       │   ├── reservations/
│       │   │   ├── reservations_cubit.dart│
│       │   │   └── reservations_state.dart
│       │   └── reservations_actions/
│       │       ├── reservations_actions_cubit.dart
│       │       └── reservations_actions_state.dart
│       ├── screens/
│       │   ├── order_details_screen.dart
│       │   ├── reservation_details_screen.dart
│       │   └── reservations_screen.dart
│       └── widgets/
│           ├── order_details_screen/
│           │   └── order_details_item.dart
│           └── reservations_screen/
│               ├── pending_tab.dart
│               ├── reservation_card.dart
│               └── reservation_card_details_item.dart
└── settings/

```

### Main

This is the starting point of the application. All the application-level configurations are defined in this file i.e., theme, routes, title, orientation, etc.

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/app/app_initializer.dart';
import 'core/app/my_app.dart';
import 'core/app_locale/app_locale.dart';
import 'core/constants/app_url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initSettingsAndServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocale.arabic, AppLocale.english],
      path: AppUrl.translations,
      startLocale: AppLocale.arabic,
      fallbackLocale: AppLocale.arabic,
      child: const MyApp(),
    ),
  );
}

```

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the Appify then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
