//
//  LoginViewModel.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 20.03.2023.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    // MARK: View Properties
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var error: String = ""
    @Published var alert = false
    @Published var visible = false
    @Published var canSubmit = false
    @Published var isEmailValid = false
    
    var emailPrompt: String? {
        if isEmailValid == true || email.isEmpty {
            return nil
        } else {
            return "Введите правильный адрес почты, например: example@gmail.com"
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    
    init() {
        $email
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    

}
