# Chatter — Real-Time Chat Application (Flutter + Supabase)

**Chatter** is a modern, scalable **real-time chat application** built with **Flutter** and **Supabase**, following **Clean Architecture** principles and best practices used in production-level apps.

The project focuses on:

* Clean separation of concerns
* Offline-first behavior
* Scalable chat architecture
* Real-world authentication & messaging flow (WhatsApp-like)

---

## 🚀 Features

### 🔐 Authentication

* Phone number authentication (OTP)
* Secure user identity management
* Persistent user session handling

### 👤 User Profile

* Create & update user profile
* Upload profile picture (Camera / Gallery)
* Default profile picture based on gender
* Local caching for offline access

### 💬 Chat System (In Progress)

* One-to-one real-time messaging
* Conversations list (last message, timestamp)
* Offline message persistence
* Prepared for push notifications

### 📱 Offline First

* Local caching using **SQLite**
* Automatic sync when network is available
* Graceful handling of network failures

---

## 🧠 Architecture

This project follows **Clean Architecture** strictly:

```
lib/
├── core/
│   ├── database/
│   ├── network/
│   ├── errors/
│   └── utils/
│
├── feature/
│   ├── authentication/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── user_profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── chat/
│       ├── data/
│       ├── domain/
│       └── presentation/
```

### Layers Responsibilities

| Layer            | Responsibility                                    |
| ---------------- | ------------------------------------------------- |
| **Presentation** | UI + Bloc (State Management)                      |
| **Domain**       | Business logic, Entities, Use Cases               |
| **Data**         | Models, Repositories, Remote & Local Data Sources |
| **Core**         | Shared utilities (DB, Network, Errors)            |

---

## 🧩 Tech Stack

* **Flutter** (Dart)
* **Supabase** (Auth, Database, Storage)
* **Firebase Auth** (OTP)
* **Bloc / Cubit** (State Management)
* **SQLite (sqflite)** — Local caching
* **GetIt** — Dependency Injection
* **Dartz** — Functional error handling
* **Clean Architecture**
* **UUID** — Message & entity IDs

---

## 📦 Dependencies

Key packages used:

```yaml
flutter_bloc
supabase_flutter
firebase_auth
sqflite
get_it
dartz
equatable
internet_connection_checker
image_picker
permission_handler
uuid
```

---

## 🔄 Data Flow Example (Update Profile)

```
UI
 ↓
Bloc Event
 ↓
Use Case
 ↓
Repository
 ↓
Remote / Local Data Source
 ↓
Result (Either<Failure, Success>)
```

---

## 🛡 Error Handling Strategy

* Uses `Either<Failure, Success>` (via **Dartz**)
* Centralized failure types:

  * NetworkFailure
  * ServerFailure
  * PermissionFailure
* UI reacts to failures gracefully

---

## 🧪 Current Status

| Feature            | Status         |
| ------------------ | -------------- |
| Authentication     | ✅ Completed    |
| User Profile       | ✅ Completed    |
| Image Upload       | ✅ Completed    |
| Local Cache        | ✅ Completed    |
| Chat (Messaging)   | 🚧 In Progress |
| Push Notifications | ⏳ Planned      |

---

## 📸 Screenshots

> *(Coming soon)*

---

## 🧑‍💻 Author

**Ibrahim Mohamed**
Flutter Developer
Clean Architecture Enthusiast

> This project is built as a **real-world learning experience**, not a demo app.

---

## ⭐ Why This Project?

✔ Not a tutorial
✔ Real backend (Supabase)
✔ Scalable structure
✔ Production-ready mindset
✔ Clean Architecture done right

---

## 📌 Future Improvements

* Group chats
* Message reactions
* Message status (sent / delivered / read)
* Push notifications
* End-to-end encryption (optional)
