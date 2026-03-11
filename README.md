# Archive App

A Flutter-based document archiving and user management application. This application provides a comprehensive interface for managing documents, assigning access rights, and handling user authentication through a REST API.

**Backend Repository:** The REST API backend for this project is built with Spring Boot. You can find its source code here: [hakstudio/archiveapp](https://github.com/hakstudio/archiveapp)

## Features

- **User Authentication:** Secure login functionality (`LoginView`).
- **Document Management:** 
  - List available documents (`ListDocumentsView`).
  - Add or edit existing documents (`EditDocumentView`).
  - Supports file picking using the `file_picker` package.
- **User Management:** 
  - List existing users (`ListUsersView`).
  - Add or edit user details (`EditUserView`).
  - Manage access authentication and authorizations (`EditAccessAuth`).
- **Archive Viewer:** View archived contents (`ArchiveView`).
- **RESTful API Integration:** Connects to a backend service for seamless data synchronization using HTTP requests (GET, POST, PUT, DELETE).

## Technologies & Packages

- [Flutter SDK](https://flutter.dev/) (>=3.1.2 <4.0.0)
- `http`: For making network requests to the REST API.
- `file_picker`: For picking local files from the device.
- `intl`: For internationalization and date formatting.
- `cupertino_icons`: For iOS style icons.

## Getting Started

Follow these steps to set up and run the application on your local machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your system.
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio) with Flutter/Dart plugins configured.
- A running REST API backend (update the API endpoints in `lib/service/rest_api.dart` as required).

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd archive_app
   ```

2. Install the necessary dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/main.dart`: Entry point of the Flutter application.
- `lib/view/`: UI screens (Login, Archives, Document/User Management).
- `lib/model/`: Data models for the business logic.
- `lib/viewmodel/`: State management and business logic handlers.
- `lib/service/`: Network layers and REST API handlers (`rest_api.dart`).

## Contributing

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
