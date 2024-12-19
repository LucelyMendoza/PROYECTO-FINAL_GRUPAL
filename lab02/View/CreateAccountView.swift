import SwiftUI

struct CreateAccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showError = false
    
    var body: some View {
        VStack {
            Text("Create your account")
                .font(.title)
                .padding(.bottom, 20)
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding(.bottom, 10)
            
            TextField("Phone Number", text: $phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.phonePad)
                .padding(.bottom, 10)
            
            TextField("New Username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if showError {
                Text("Passwords do not match")
                    .foregroundColor(.red)
                    .padding(.bottom, 10)
            }
            
            Button("Create Account", action: createAccount)
                .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
    
    func createAccount() {
        if newPassword != confirmPassword {
            showError = true
        } else {
            showError = false
            CoreDataManager.shared.saveUser(
                firstName: firstName,
                lastName: lastName,
                email: email,
                username: newUsername,
                password: newPassword
            )
            print("New account created and saved with username: \(newUsername)")
        }
    }
}
