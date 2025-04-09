## 🚗 Car Rental App – Flutter UI

A sleek and modern Flutter UI for a Car Rental Application, designed with a clean user interface and smooth animations.
This project showcases a responsive mobile app layout.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ales-dev-studio/car_rental_app.git
   ```

2. Change to the project directory:

   ```bash
   cd car_rental_app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Structure

The app follows the Clean Architecture principles, with the following structure:

- `lib/`
    - `core/`: Contains Core Utilities that used entire application
    - `features/`:
        - `{features_a}`:
            - `data/`: Contains the data layer responsible for handling data fetching and caching.
            - `domain/`: Defines the core business logic and entities of the app.
            - `presentation/`: Contains the UI layer of the app, including BLOCs, views, and widgets.
    - `main.dart`: Entry point of the application.
