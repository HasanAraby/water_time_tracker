Water Time Tracker
Water Time Tracker is an intuitive and efficient app designed to help you monitor your daily water intake. This app allows you to track the amount of water you've consumed today and in the past by logging each entry into a local database using the sqflite package.

Features
Track Water Intake: Add the amount of water you drink, record the time and date, and store it in the local database.

Visual Animation: The app includes an engaging animation that displays the percentage of your water intake against the daily goal you set for yourself.

Modify Records: Easily add, delete, or update your water intake records and adjust your daily water intake goal at any time.

Detailed Records: Each record in the database includes the amount of water (in mL), time (hours:minutes), and date.

Technical Features
State Management: Utilizes the BLoC pattern for efficient state management.

Animation: Smooth and responsive animations to enhance the user experience.

Dependency Injection: Implemented using the get_it package for better modularity and testability.

Clean Code: Adheres to clean code principles and best practices.

Architecture Pattern (MVVM): Organized using the Model-View-ViewModel pattern for scalable and maintainable code.

Local Database: Manages data locally using the sqflite package.

Packages Used
cupertino_icons: ^1.0.8

equatable: ^2.0.7

flutter

flutter_bloc: ^8.1.6

get_it

intl: ^0.20.1

path

shared_preferences: ^2.3.3

sqflite: ^2.4.1

wave_loading_indicator