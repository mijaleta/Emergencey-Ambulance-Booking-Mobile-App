# Emergency Ambulance Booking Mobile App

[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D2.0.0-blue)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%3E%3D2.12.0-blue)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

The Emergency Ambulance Booking Mobile App is a Flutter-based mobile application designed to provide quick and reliable access to emergency medical services. Users can request an ambulance with just a few taps, track its arrival in real-time, and manage their emergency contacts and medical information.

## Features

- **Instant Ambulance Booking**: Request an ambulance quickly during emergencies with minimal steps.
- **Real-Time Tracking**: Monitor the ambulance's location and estimated arrival time on a map.
- **User Profile Management**: Store personal details, medical history, and insurance information for faster service.
- **Emergency Contacts**: Add and notify emergency contacts automatically when an ambulance is booked.
- **Service History**: View past ambulance bookings, including timestamps and details.
- **Multi-language Support**: Available in multiple languages for broader accessibility.
- **Offline Mode**: Basic functionality available even with limited connectivity.
- **Secure Authentication**: Protect user data with secure login and data encryption.

## Screenshots

![Home Screen](screenshots/home.png)
*Home screen showing quick booking option*

![Booking Screen](screenshots/booking.png)
*Ambulance booking interface with location selection*

![Tracking Screen](screenshots/tracking.png)
*Real-time ambulance tracking on map*

![Profile Screen](screenshots/profile.png)
*User profile and medical information management*

*Note: Replace placeholder screenshots with actual app screenshots.*

## Architecture

The app follows a modular architecture with separation of concerns:

- **Presentation Layer**: Flutter widgets and state management (using Provider/Riverpod/Bloc)
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories handling data from local storage and remote APIs
- **Services**: Firebase authentication, cloud messaging, Google Maps API, and RESTful backend services

## Installation

### Prerequisites
- Flutter SDK >= 2.0.0
- Dart SDK >= 2.12.0
- Android Studio / Xcode (for mobile emulators/simulators)
- Firebase account (for backend services)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/mijaleta/Emergency-Ambulance-Booking-Mobile-App.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Emergency-Ambulance-Booking-Mobile-App
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Configure Firebase:
   - Follow the [Firebase setup guide](https://firebase.flutter.dev/docs/overview) for Android and iOS
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and place them in the respective app directories

5. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. Launch the app on your device or emulator.
2. Sign up or log in to create a user profile.
3. Add emergency contacts and medical information in the profile section.
4. In an emergency, tap the "Book Ambulance" button on the home screen.
5. Confirm your location and any additional details.
6. Track the ambulance in real-time until arrival.
7. View booking history in the app's history section.

## Technologies Used

- **Frontend**: Flutter 2.0+, Dart 2.12+
- **State Management**: Provider/Riverpod (specify which one used)
- **Backend**: Node.js with Express, Firebase Authentication, Firebase Cloud Messaging
- **Database**: MongoDB (via backend APIs) and Firebase Firestore (for real-time data)
- **Maps & Navigation**: Google Maps API
- **Local Storage**: SharedPreferences/Hive (specify)
- **Version Control**: Git
- **CI/CD**: GitHub Actions (if applicable)

## Backend Repository

The backend for this application is located at: [Backend Repository Link]
*(Add link to backend repository if separate)*

## Contribution

Contributions are welcome! If you'd like to contribute to this project:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/AmazingFeature`).
3. Make your changes and commit them (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

Please ensure your code follows the project's coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Miratu Ujaallata - miratuujaallataa@gmail.com

Project Link: [https://github.com/mijaleta/Emergency-Ambulance-Booking-Mobile-App](https://github.com/mijaleta/Emergency-Ambulance-Booking-Mobile-App)

## Acknowledgments

- Flutter team for the excellent cross-platform framework
- Firebase team for backend services
- Google Maps Platform for mapping services
- Open-source contributors whose packages were used in this project