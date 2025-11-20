# 🌊 Flow

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Bloc](https://img.shields.io/badge/bloc-8B0000.svg?style=for-the-badge&logo=bloc&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

> **Boost your productivity and achieve your flow with our simple yet powerful task management app.**

---

## ✨ Features

*   ✅ **Task Management:** Add, edit, and delete tasks with ease.
*   🎯 **Organization:** Organize tasks with optional categories.
*   ⏰ **Reminders:** Set due dates and never miss a deadline.
*   🎨 **Intuitive UI:** A clean, modern interface designed for focus.
*   🌙 **Dark Mode:** Easy on the eyes, perfect for night owls.

## 🛠️ Technology Stack

Built with a robust and scalable architecture:

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** [Bloc / Cubit](https://bloclibrary.dev/)
*   **Architecture:** Clean Architecture (Data, Domain, Presentation)
*   **DI:** [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
*   **Localization:** [Slang](https://pub.dev/packages/slang)

## 📂 Project Structure

We follow a strict **Clean Architecture** pattern to ensure scalability and maintainability.

```
lib
├── core            # Shared utilities, configs, and base classes
├── features        # Feature-based modules (Auth, Todo, etc.)
│   └── todo
│       ├── data        # API calls, models, repositories implementation
│       ├── domain      # Entities, usecases, repository interfaces
│       └── presentation # BLoCs, pages, widgets
├── injection_container.dart # Dependency Injection setup
└── main.dart       # App entry point
```

## 🚀 Getting Started

Follow these steps to get the project running on your local machine.

### Prerequisites

*   [Flutter SDK](https://flutter.dev/docs/get-started/install)
*   [Dart SDK](https://dart.dev/get-dart)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/s4nk37/flow.git
    cd flow
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Generate code (JSON serialization, DI, etc.):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

## 🧰 Developer Toolkit

We have a powerful CLI assistant to help you with common tasks.

**Usage:**
```bash
./flutter_toolkit.sh
```

**Menu Options:**
*   🚑 **Analyze & Fix:** Auto-format and fix lint issues.
*   🧹 **Deep Clean:** Remove build artifacts and cache.
*   🏭 **Code Generation:** Run `build_runner` and `slang`.
*   📦 **Build:** Generate APKs and IPAs.
*   🧪 **Test:** Run unit and widget tests.

> **Note:** Always run `./flutter_toolkit.sh` and choose option **1 (Analyze & Fix)** before pushing your code to ensure it meets our quality standards.

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Please read our [CONTRIBUTING.md](CONTRIBUTING.MD) for details on our code of conduct and the process for submitting pull requests.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
