# flutter_base_project
Flutter base project with language and theme management

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


lib/
│
├── models/          # Contiene le classi dei modelli di dati
│
├── views/           # Contiene i widget dell'interfaccia utente
│
├── controllers/     # Contiene la logica di business (se usi MVC)
│
├── services/        # Contiene i servizi per la comunicazione con server o API
│   └── api_service.dart
│
├── providers/       # Contiene i provider per la gestione dello stato
│   └── theme_provider.dart
│
├── themes/          # Contiene i file relativi ai temi
│   └── app_theme.dart
│
├── utils/           # Contiene utility e helper functions
│   └── date_utils.dart
│
├── extensions/       # Contiene le estensioni
│
└── main.dart        # Punto di ingresso dell'app