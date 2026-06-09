# LAB 1 REPORT: SETTING UP FLUTTER AND RUNNING YOUR FIRST APP

## Exercise 4 – Reflection Questions

### Question 1: What is the purpose of the `flutter doctor` command?
* **Answer:** The `flutter doctor` command is a diagnostic tool used to check the health of the development environment. It inspects the local system to verify if the Flutter SDK, required IDEs (like Android Studio or VS Code), Android/iOS toolchains, and connected devices are properly installed and configured, providing actionable guidance if any issues or missing dependencies are found.

### Question 2: What file acts as the entry point of a Flutter application?
* **Answer:** The file that acts as the entry point of a Flutter application is **`lib/main.dart`**. Specifically, execution begins at the **`main()`** function located inside this file, which in turn calls `runApp()` to launch the application widget tree.

### Question 3: Explain the difference between Hot Reload and Hot Restart.
* **Answer:** * **Hot Reload:** Compiles the newly added code changes and injects them directly into the Dart Virtual Machine (VM) without restarting the app. It updates the UI in milliseconds while **preserving the current state** of the application (e.g., keeping counter values or input fields intact).
  * **Hot Restart:** Completely destroys the current state of the application and rebuilds the widget tree from scratch. It takes slightly longer than Hot Reload because it **resets the app state** back to its default initial values.

### Question 4: How does `runApp()` build the widget tree?
* **Answer:** The `runApp()` function takes the given root widget (e.g., `MyApp`) and attaches it as the absolute root of the Flutter widget tree. It serves as the bridge between the Flutter framework and the underlying engine, instructing Flutter to inflate the widget, manage its lifecycle, and render its layout directly onto the screen.

### Question 5: Describe how Flutter’s architecture enables cross-platform development.
* **Answer:** Unlike traditional frameworks that rely on native platform UI components via a bridge, Flutter bypasses the native OEM widgets entirely. It utilizes its own high-performance rendering engine (such as Impeller or Skia) to draw every single pixel of the user interface directly onto a blank canvas provided by the host operating system. This architectural approach allows the exact same Dart code to render identically and perform natively across multiple platforms like Android, iOS, Web, and Desktop.