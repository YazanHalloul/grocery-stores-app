# Grocery Stores App – Technical Assignment

## Overview

This Flutter application displays a list of grocery stores retrieved from a remote API.

The app supports searching, sorting, filtering, and proper state handling using Cubit (BLoC pattern). The project follows a clean separation between presentation, domain, and data layers.

---

## Architecture

The project follows a simplified Clean Architecture approach:

- Presentation Layer
  - Cubit (flutter_bloc) for state management
  - UI screens and widgets
- Domain Layer
  - Entities
  - Repository abstraction
  - Use cases
- Data Layer
  - Models
  - Remote data source
  - Repository implementation
  - API client

State management is implemented using Cubit (flutter_bloc).

---

## Features

- Display list of grocery stores
- Debounced search (by name or description)
- Sort by:
  - ETA (ascending)
  - Minimum order (ascending)
- Filter:
  - Open only
  - All stores
- Clear search functionality
- Loading state
- Error state with retry
- Empty (no results) state
- Fallback UI for image loading errors

---

## Error Handling

The application handles:

- Network failures
- Invalid responses
- Empty search results

In case of failure, an error state is displayed with a retry option.

---

## Security

The secretKey is NOT committed to the repository.

The application uses compile-time environment variables via:

--dart-define


---

## How to Run the Project

Clone the repository:
git clone https://github.com/YazanHalloul/grocery-stores-app.git

Run the app with your secret key:

flutter run --dart-define="SECRET_KEY=your_secret_key_here"