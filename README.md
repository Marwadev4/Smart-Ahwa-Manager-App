# Smart Ahwa Manager App

A modern Flutter application designed to help manage traditional Egyptian coffee houses (Ahwa). This application provides an intuitive interface for managing orders, tracking sales, and monitoring daily operations in your coffee shop.

## 🌟 Features

### 📋 Order Management
- Add new orders with customer details and special instructions
- Track order status (pending/completed)
- Delete orders with swipe-to-delete functionality
- Real-time updates for all orders

### 🍵 Drink Management
- Support for various traditional drinks
- Customizable drink options
- Track popular items

### 📊 Dashboard
- Real-time order tracking
- Clean and intuitive interface
- Responsive design for all screen sizes

### 🎨 Modern UI/UX
- Beautiful, user-friendly interface
- Smooth animations and transitions
- Right-to-left (RTL) support for Arabic language
- Custom themes and styling

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: Bloc/Cubit
- **Local Database**: SQLite (sqflite)
- **UI Components**: Custom widgets with Material Design
- **Dependency Injection**: get_it
- **Internationalization**: Easy Localization (for future RTL support)

## 📱 Screenshots

<table>
  <!-- First Row -->
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/3bb061f7-e6cf-48db-806a-68ab4c5d029b" width="200"/>
      <br/>
      <em>Home Screen</em>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/f65512c7-3099-422c-ad5f-c27ab52aaa82" width="200"/>
      <br/>
      <em>Add Order</em>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/dc0b333c-e4df-45af-ae27-a0bfca80d567" width="200"/>
      <br/>
      <em>Order List</em>
    </td>
  </tr>
  <!-- Second Row -->
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/a8f84e37-7d30-4282-880a-2deb1cad2a6d" width="200"/>
      <br/>
      <em>Order Details</em>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/62d22928-1c03-4914-b44d-1fe38488d639" width="200"/>
      <br/>
      <em>Delete Order</em>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/a4b468d3-d799-4666-8289-ad0cf7013daa" width="200"/>
      <br/>
      <em>Orders</em>
    </td>
  </tr>
</table>
## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / Xcode (for running on emulator/device)
- VS Code or Android Studio (recommended IDEs)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/smart-ahwa-manager-app.git
   cd smart-ahwa-manager-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── di/               # Dependency injection setup
│   ├── helpers/          # Helper classes and extensions
│   ├── local_db/         # Database implementation
│   └── theming/          # App themes and styles
├── features/
│   └── home/             # Main feature module
│       ├── data/         # Data layer
│       ├── logic/        # Business logic (Cubit/Bloc)
│       └── ui/           # UI components and screens
└── main.dart             # App entry point
```

## 🧩 Dependencies

- `flutter_bloc`: State management
- `equatable`: For value equality
- `get_it`: Service locator
- `sqflite`: Local database
- `intl`: For date and number formatting
- `flutter_screenutil`: For responsive UI
- `lottie`: For animations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgments

- Thanks to all contributors who have helped shape this project
- Special thanks to the Flutter community

## 📬 Contact

Marwa Mohammed - [@LinkedIN](https://www.linkedin.com/in/marwa-mohammed-jassim97/) - marwa.mohamed.jasim@hotmail.com

Project Link: [https://github.com/Marwadev4/smart-ahwa-manager-app](https://github.com/Marwadev4/smart-ahwa-manager-app)
