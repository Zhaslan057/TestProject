//
//  LoginView.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 20.03.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel: LoginViewModel = .init()
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("logStatus") var logStatus = false
    @State private var isLogin = false
    @State var email = ""
    @State var password = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var showAlert = false
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 35) {
                
                Text(isLogin ? "Welcome back" : "Sign in")
                    .font(.custom("Montserrat", size: 26))
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.bottom, 40)
                
                VStack(spacing: 35) {
                    if isLogin == false {
                        CustomTextField(title: "First name", text: $firstName)
                        CustomTextField(title: "Last name", text: $lastName)
                    }
                }
                
                CustomTextField(title: "E-mail", text: $email, prompt: loginModel.emailPrompt)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                
                if isLogin {
                    HStack{
                        if loginModel.visible{
                            TextField("Password", text: $password)
                                .autocapitalization(.none)
                        }
                        else{
                            SecureField("Password", text: $password)
                                .autocapitalization(.none)
                        }
                        
                        Button(action: {
                            loginModel.visible.toggle()
                        }) {
                            Image(systemName: loginModel.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.black.opacity(0.7))
                        }
                    }
                    .padding(16)
                    .background(Capsule().fill(Color("TextfieldBack")))
                }
                if isLogin {
                    loginButton
                } else {
                    signinButton
                }
                
                HStack {
                    Text(!isLogin ? "Already have an account? ": "Doesn't have account? ")
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            isLogin.toggle()}
                    } label: {
                        Text(isLogin ? "Sign in" : "Log in")
                    }
                    .foregroundColor(.blue)
                }
                .font(.custom("Montserrat", size: 16))
                .foregroundColor(.secondary)
                
                if !isLogin {
                    VStack(spacing: 20){
                        CustomButton()
                        
                        CustomButton(isGoogle: true)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 15)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
    
    @ViewBuilder
    func CustomButton(isGoogle: Bool = false)->some View{
        HStack{
            Group{
                if isGoogle {
                    Image("Google")
                        .resizable()
                        .renderingMode(.template)
                } else {
                    Image(systemName: "applelogo")
                        .resizable()
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .frame(height: 45)
            
            Text("\(isGoogle ? "Sign in with Google" : "Sign in with Apple")")
                .font(.custom("Montserrat", size: 16))
                .lineLimit(1)
        }
        .foregroundColor(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(Color("Background"))
        }
    }
    
    // MARK: Buttons
    var loginButton: some View {
        Button {
            if CoreDataManager.shared.validateUser(email: loginModel.email, password: loginModel.pass) {
                logStatus = true
            }
        } label: {
            Text("Login")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.blue)
                }
        }
        .disabled(!loginModel.canSubmit)
    }
    var signinButton: some View {
        Button {
            let newUser = Users(context: viewContext)
            newUser.email = self.email
            newUser.password = "1234"
            newUser.firstName = self.firstName
            newUser.lastName = self.lastName
            
            do {
                try viewContext.save()
                print("user saved")
                showAlert = true
                
            } catch let error as NSError {
                print("can't save user")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        } label: {
            Text("Sign in")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.blue)
                }
        }
        .disabled(!loginModel.canSubmit)
        .alert("Успешно зарегистрирован", isPresented: $showAlert) {
            Button("Хорошо", role: .cancel) {
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

