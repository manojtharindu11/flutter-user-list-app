
# Hello World Flutter

This Flutter project is a simple app to fetch and display a list of users from the [Random User API](https://randomuser.me). It includes an interface to show user details such as profile picture, name, and email. This project was created by following a YouTube tutorial.

## Features

- Fetches user data from an API
- Displays user data in a list format
- Shows user's profile picture, full name, and email in a `ListTile` widget
- Supports user model mapping from API JSON response

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An IDE like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installing

1. Clone the repository.
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory.
   ```bash
   cd hello-world-flutter
   ```
3. Install dependencies.
   ```bash
   flutter pub get
   ```

### Running the App

To run the app, connect a device or start an emulator, then use:
```bash
flutter run
```

## Project Structure

- **HomeScreen**: The main screen displaying a list of users fetched from the API.
- **User API Service**: Handles the HTTP requests and JSON decoding.
- **User Model**: Defines the user structure and mappings for JSON data.

## Code Overview

### `HomeScreen`

- A `StatefulWidget` that initializes and displays a list of users.
- Uses `ListView.builder` to display each user in a `ListTile` with a circular profile picture, name, and email.

### `UserApi`

- Contains a method `fetchUsers` which makes an HTTP GET request to the Random User API.
- Converts JSON response into a list of `User` objects.

### `User` Model

- Represents the user data structure with fields like `gender`, `email`, `phone`, `name`, and `picture`.
- `fromMap` factory constructor is used to parse JSON data into a `User` object.

## Dependencies

- **http**: Used for making network requests.
- **material**: Core Flutter library for UI components.

To add dependencies, include them in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.15.0 # or latest version
```

## API Reference

This project uses the [Random User API](https://randomuser.me) to generate random user data. The API URL used is:
```plaintext
https://randomuser.me/api/?results=100
```