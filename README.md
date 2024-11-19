# flutter_base_project
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# My Flutter Project

This is the main repository for my Flutter project.
The structure is based on the hexagonal architecture, clearly separating the responsibilities between the various layers of the application.

## Folder structure

```
lib/
├── l10n
└── src/
    ├── core/
    │   ├── error/
    │   ├── extensions/
    │   ├── providers/
    │   └── theme/
    ├── data
    │   ├── dataSources/
    │   │   ├── local
    │   │   └── remote
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── interfaces/
    │   ├── sevices/
    │   └── useCases/
    └── presentation/
        ├── pages/
        ├── utils/
        └── widgets/
```

## Description of the structure

### lib/src/core/

This folder contains the basic features of the application.

- `error/`:  Manages error handling in the application, providing classes and methods for exception handling and error states.
- `extensions/`: Contains extensions for existing Dart classes, enhancing base classes with new properties or useful methods.
- `network/`: Provides utilities for network connectivity management, including connection checks and HTTP response handling.
- `providers/`: Manages application state using Flutter providers, providing a centralized structure for state management.
- `theme/`: Manages application theme settings, allowing access to color and style properties.
- `utils/`: Contains common utilities for the application, such as conversions, validations, and other auxiliary methods

### lib/src/data/

This folder manages application data.

- `dataSources/`: Provides local and remote data sources, including RESTful API services, local databases, and other external data sources.
- `models/`: Defines classes that represent data models received from APIs or local databases, providing a consistent structure for data manipulation within the application.
- `repositories/`: Implements domain interfaces with concrete implementations, managing access and data retrieval from various sources.

### lib/src/domain/

The core part of the project, containing the business logic.

- `entities/`: Defines classes that represent domain objects, such as business logic models and data structures.
- `interfaces/`: Provides interfaces for repositories, defining contracts for data access.
- `sevices/`: Manages services used in the domain, providing common functionalities and operations on multiple entities.
- `useCases/`: Implements application use cases, combining entities, interfaces, and services to perform complex operations.

### lib/src/presentation/

Questa cartella contiene tutto ciò che riguarda l'interfaccia utente dell'applicazione.

- `pages/`: Contains the main screens of the application, managing state and navigation between pages.
- `utils/`: Provides utilities used in presentation, such as formatting, conversions, and other auxiliary functions.
- `widgets/`: Contains reusable widgets, custom UI components, and common interface elements.

### lib/l10n/

Contains JSON files of translations for the various languages of the application.

## How to contribute

To add new features or changes to the project:

1. Add new files to the appropriate folder.
2. Follow the project's coding conventions.
3. Update the README.md with a brief description of the new feature if relevant.

## Used tools

- Flutter
- Dart 
- Provider for state management
- Shared Preferences for local storage


### Key thoughts

- All necessary packages are listed in the pubspec.yaml file.
- The code follows Flutter and Dart conventions.
- Dart extensions are used to enhance the usefulness of existing classes.
- The structure is based on the hexagonal architecture to ensure a clear separation of responsibilities.
- Implement unit tests for each layer, especially in the domain and repositories.

### Potential improvements
- Use feature flags to enable/disable features during development (like PostHog).
- Consider implementing dependency injection for better testability and maintainability.
- Add more detailed documentation for complex use cases and domain entities.
- Implement proper error handling and logging throughout the application.

