//
//  Readme.md
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//


Sure! Here’s a plain text version of the README that you can copy and paste directly:

---

# SwiftUI Authentication System

A simple SwiftUI-based login and registration system with alerts, localization, and reusable components. This project demonstrates a clean structure for building authentication in SwiftUI without a separate User model.

---

## Folder Structure

Views

* Authentication

  * LoginView.swift
  * RegisterView.swift
  * Components

    * AppButton.swift
    * AppTextField.swift
* HomeView.swift

---

## Features

* Login and Registration
* Alerts with custom messages
* Localization support (English + Bangla)
* Reusable components (AppButton, AppTextField)
* Navigation between Login and Register views
* Conditional navigation after successful registration or login
* No separate User model required; authentication handled via API token

---

## Localization

The app supports multiple languages using Localizable.strings. Example keys:

Authentication
"LOGIN_TITLE" = "Welcome Back";
"USERNAME_OR_EMAIL_PLACEHOLDER" = "Username or Email";
"PASSWORD_PLACEHOLDER" = "Password";
"LOGIN_BUTTON_TITLE" = "Login";
"REGISTRATION_FROM_HERE_TITLE" = "Don't have an account? Sign Up";
"CREATE_ACCOOUNT_TITLE" = "Create Account";
"USERNAME_PLACEHOLDER" = "Username";
"EMAIL_PLACEHOLDER" = "Email";
"SIGNUP_BUTTON_TITLE" = "Sign Up";
"LOGIN_FROM_HERE_TITLE" = "Already have an account? Log In";

Alerts
"EMPTY_FIELDS_ALERT" = "Please fill all fields";
"INVALID_CREDENTIALS_ALERT" = "Invalid credentials";
"LOGIN_SUCCESSFULL_ALERT" = "Login successful!";
"REGISTRATION_SUCCESSFULL_ALERT" = "User registered successfully!";
"REGISTRATION_FAILED_ALERT" = "Registration failed. Please try again.";
"LOGOUT_ALERT" = "User logged out.";

* To add a new language, create a new Localizable.strings file (e.g., Localizable.strings (Bangla)) and add translations for all keys.
* Use NSLocalizedString("KEY", comment: "") or LocalizedStringKey("KEY") in views.

---

## Reusable Components

**AppButton**

A reusable button component with customizable title, color, and action.

**AppTextField**

A reusable text field component for consistent styling across Login and Registration screens.

---

## UserSession

Handles:

* Login
* Registration
* Logout
* Publishing alertMessage for alerts

No separate User model is required; the system works with token-based authentication.

---

## API Endpoints

Defined in API.swift:

* login: /api/auth/login
* register: /api/auth/register
* logout: /api/auth/logout
* userInfo: /api/user/me

The base URL changes depending on device type:

* Simulator: [http://127.0.0.1:8080](http://127.0.0.1:8080)
* Real device: http://<local-network-ip>:8080

---

## Notes on Testing

* On a simulator, the app uses [http://127.0.0.1:8080](http://127.0.0.1:8080).
* On a real device, update getBaseURL with your Mac’s local network IP (e.g., [http://192.168.1.100:8080](http://192.168.1.100:8080)).
* Ensure your backend API is running and accessible from the device.
* You can also switch to Postman or a remote server by modifying the base URL.

---

## How to Run

1. Clone the repository.
2. Open AuthenticationSystem.xcodeproj in Xcode.
3. Ensure UserSession is provided as an environment object:

```
@main
struct MyApp: App {
    @StateObject var session = UserSession()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(session)
        }
    }
}
```

4. Run on simulator or device.
5. Test login and registration.

---

## License

MIT License

---

I can also draft a **short version for GitHub front page** if you want, which is cleaner for viewers. Do you want me to do that?
