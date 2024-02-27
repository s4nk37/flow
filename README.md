
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
assets
├── animations
├── fonts
│   └── SourceCodePro
│       ├── SourceCodePro-Bold.ttf
│       ├── SourceCodePro-Light.ttf
│       ├── SourceCodePro-Medium.ttf
│       ├── SourceCodePro-Regular.ttf
│       └── SourceCodePro-SemiBold.ttf
├── icons
│   └── logo.png
├── images
└── translations
lib
├── core
│   ├── configs
│   │   └── app_config.dart
│   ├── errors
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network
│   │   └── network_info.dart
│   ├── router
│   ├── services
│   ├── usecases
│   │   └── usecase.dart
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
│       │   │   ├── todo_local_datasource.dart
│       │   │   └── todo_remote_datasource.dart
│       │   ├── models
│       │   │   ├── todo_model.dart
│       │   │   └── todo_model.g.dart
│       │   └── repositories
│       │       └── todo_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   └── todo.dart
│       │   ├── repositories
│       │   │   └── todo_repository.dart
│       │   └── usecases
│       │       ├── add_todo.dart
│       │       ├── delete_all_todos.dart
│       │       ├── delete_completed_todos.dart
│       │       ├── delete_todo_by_id.dart
│       │       ├── get_todo_by_id.dart
│       │       ├── get_todos.dart
│       │       ├── mark_todo_as_completed.dart
│       │       ├── mark_todo_as_incompleted.dart
│       │       └── update_todo.dart
│       └── presentation
│           ├── bloc
│           │   ├── todo_bloc.dart
│           │   ├── todo_event.dart
│           │   └── todo_state.dart
│           ├── pages
│           │   └── home_page.dart
│           └── widgets
└── main.dart
test
├── core
├── features
│   └── todo
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   │   └── todo_model_test.dart
│       │   └── repositories
│       │       └── todo_repository_impl_test.dart
│       ├── domain
│       │   ├── entities
│       │   ├── repositories
│       │   └── usecases
│       │       ├── add_todo_test.dart
│       │       ├── delete_all_todos_test.dart
│       │       ├── delete_completed_todos_test.dart
│       │       ├── delete_todo_by_id_test.dart
│       │       ├── get_todo_by_id_test.dart
│       │       ├── get_todos_test.dart
│       │       ├── mark_todo_as_completed_test.dart
│       │       ├── mark_todo_as_incompleted_test.dart
│       │       └── update_todo_test.dart
│       └── presentation
│           ├── bloc
│           ├── pages
│           └── widgets
├── fixtures
│   ├── fixture_reader.dart
│   ├── todo.json
│   ├── todos.json
│   └── todos_double.json
└── helpers
    ├── test_mock.dart
    └── test_mock.mocks.dart
```
**Getting Started:**

1.  Clone the repository:  `git clone https://github.com/your_username/simple_task_manager`
2.  Install dependencies:  `flutter pub get`
3.  Run following command to generate required files: `dart run build_runner build`
4.  Run the app:  `flutter run`

**Technology Stack:**

-   Flutter
-   Bloc


**Contributing:**

We welcome contributions to this project! Feel free to fork the repository, make changes, and submit a pull request.

**License:**

This project is licensed under the MIT License. See the `LICENSE` file for details.
