
# Flow

Boost your productivity and achieve your flow with our simple yet powerful task management app.

**Features:**

-   Add, edit, and delete tasks
-   Mark tasks as complete
-   Organize tasks with categories (optional)
-   Set due dates and reminders (optional)
-   Simple and intuitive user interface

**Folder Structure:**
```
lib
├── core
│   ├── configs
│   │   └── app_config.dart
│   ├── errors
│   ├── router
│   ├── services
│   ├── utils
│   │   ├── constants
│   │   │   └── enums
│   │   ├── extensions
│   │   ├── responsive.dart
│   │   ├── theme
│   │   │   ├── app_theme.dart
│   │   │   └── cubit
│   │   │       └── theme_cubit.dart
│   │   └── validations
│   └── widgets
├── features
│   └── todo
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   └── repositories
│       ├── domain
│       │   ├── entities
│       │   ├── repositories
│       │   └── usecases
│       └── presentation
│           ├── bloc
│           │   ├── todo_bloc.dart
│           │   ├── todo_event.dart
│           │   └── todo_state.dart
│           ├── pages
│           │   └── home_page.dart
│           └── widgets
└── main.dart
```
**Getting Started:**

1.  Clone the repository:  `git clone https://github.com/your_username/simple_task_manager`
2.  Install dependencies:  `flutter pub get`
3.  Run following command to generate required files: `dart run build_runner build`
3.  Run the app:  `flutter run`

**Technology Stack:**

-   Flutter
-   Bloc


**Contributing:**

We welcome contributions to this project! Feel free to fork the repository, make changes, and submit a pull request.

**License:**

This project is licensed under the MIT License. See the `LICENSE` file for details.
