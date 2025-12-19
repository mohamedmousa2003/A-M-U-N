# A M U N 

📄 Implemented Screens
Splash Screen
Onboarding (3 Screens)
Authentication Screen

## 📦 Packages Used
- [`flutter_svg`](https://pub.dev/packages/flutter_svg/install)
- [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)
- [`smooth_page_indicator`](https://pub.dev/packages/smooth_page_indicator)
- [`dio`](https://pub.dev/packages/dio)
- [`bloc`](https://pub.dev/packages/bloc)
- [`url_launcher`](https://pub.dev/packages/url_launcher)


## 📱 Screenshots

|                Splash                 |                  Onboarding One                   |                    Onboarding Two                    |                     Onboarding last                     |
|:-------------------------------------:|:-------------------------------------------------:|:----------------------------------------------------:|:-------------------------------------------------------:|
| ![Splash](assets/screenshot/splash_screen.png) | ![Onboarding One ](assets/screenshot/onboarding_one.png) | ![Onboarding Two](assets/screenshot/onboarding_two.png) | ![Onboarding last](assets/screenshot/onboarding_last.png) |


🔁 App Flow
Splash Screen
      ↓
Onboarding Screens (3 pages)
      ↓
Authentication Screen



////? 

User Action
↓
UI (Widget)
↓
Cubit / Bloc
↓
UseCase
↓
Repository (abstract)
↓
Repository Implementation
↓
Remote / Local Data Source
↓
API / DB
↓
Response
↑
Model → Entity
↑
UseCase
↑
Cubit / Bloc
↑
UI Update


//? Auth 
lib/features/auth/
├── presentation/
│   ├── cubit/
│   │   └── auth_cubit.dart
│   ├── pages/
│   │   ├── login_page.dart
│   │   ├── register_page.dart
│   │   └── forget_password_page.dart
│
├── domain/
│   ├── entities/
│   │   └── user_entity.dart
│   ├── repositories/
│   │   └── auth_repository.dart
│   └── usecases/
│       ├── login_usecase.dart
│       ├── register_usecase.dart
│       ├── google_login_usecase.dart
│       └── forget_password_usecase.dart
│
└── data/
├── models/
│   └── user_model.dart
├── datasources/
│   └── auth_remote_data_source.dart
└── repositories/
└── auth_repository_impl.dart

//? Home
lib/features/home/
├── presentation/
│   ├── cubit/
│   │   └── home_cubit.dart
│   ├── pages/
│   │   └── home_page.dart
│   └── widgets/
│       ├── hotel_list.dart
│       ├── classical_list.dart
│       └── riviera_list.dart
│
├── domain/
│   ├── entities/
│   │   ├── hotel_entity.dart
│   │   ├── classical_entity.dart
│   │   └── riviera_entity.dart
│   ├── repositories/
│   │   └── home_repository.dart
│   └── usecases/
│       ├── get_hotels_usecase.dart
│       ├── get_classical_usecase.dart
│       └── get_riviera_usecase.dart
│
└── data/
├── models/
│   ├── hotel_model.dart
│   ├── classical_model.dart
│   └── riviera_model.dart
├── datasources/
│   └── home_remote_data_source.dart
└── repositories/
└── home_repository_impl.dart

