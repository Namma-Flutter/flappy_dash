# flappy_dash

A Flutter-based 2D Flappy Bird clone featuring Dash, Firebase authentication, online high score tracking, and cross-platform support across mobile, desktop, and web platforms.

## Features

- **Game Physics & Rendering**: Parallax background scrolling, Dash character movement, pipe obstacles, hidden collectible coins, and tap-to-play controls.
- **State Management**: BLoC pattern separating game state (`bloc/game/`) and authentication state (`bloc/auth/`).
- **Firebase Services**: Firebase Authentication and Firestore backend integration for user login and leaderboard score storage.
- **Audio Effects**: Background music and sound effects for gameplay actions and scoring.
- **Multi-Platform Support**: Configured builds for Android, iOS, Web, macOS, Windows, and Linux.

## Requirements

- Flutter SDK
- Platform-specific build tools:
  - Android Studio / Android SDK (for Android builds)
  - Xcode (for iOS and macOS builds)
  - CMake and GTK 3 development libraries (for Linux builds)
  - Visual Studio with C++ tools (for Windows builds)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Namma-Flutter/flappy_dash.git
   ```

2. Change to the project directory:
   ```bash
   cd flappy_dash
   ```

3. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

## Configuration

Firebase options are declared in `lib/firebase_options.dart`. Android settings use `android/app/google-services.json`, and web hosting options are configured in `firebase.json` and `.firebaserc`.

## Usage

Start the app on an active device or emulator:

```bash
flutter run
```

To run on a specific target platform:

```bash
flutter run -d chrome
flutter run -d android
flutter run -d ios
flutter run -d macos
flutter run -d windows
flutter run -d linux
```

## Project Structure

```
lib/
├── audio_helper.dart                 # Audio loading and playback routines
├── bloc/                             # State management
│   ├── auth/                         # Authentication state logic
│   └── game/                         # Game loop and score state logic
├── component/                        # Game entities
│   ├── dash.dart                     # Dash player character
│   ├── dash_parallax_background.dart # Scrolling parallax environment
│   ├── flappy_dash_root_component.dart # Root game component wrapper
│   ├── hidden_coin.dart              # Collectible coin items
│   ├── pipe.dart                     # Individual pipe obstacle
│   └── pipe_pair.dart                # Pipe pair obstacles
├── widget/                           # UI overlays and screens
│   ├── game_over_widget.dart         # Game over display
│   ├── score_board_widget.dart       # Score display widget
│   ├── tap_to_play.dart              # Start screen overlay
│   └── top_score.dart                # Leaderboard display
├── firebase_options.dart             # Generated Firebase configurations
├── flappy_dash_game.dart             # Main game loop setup
├── global.dart                       # Global constants and state
├── login_page.dart                   # Login screen
├── main.dart                         # Application entry point
├── main_page.dart                    # Main game UI container
└── service_locator.dart              # Dependency injection registration
```

## Testing

Run unit and widget tests using the Flutter test runner:

```bash
flutter test
```