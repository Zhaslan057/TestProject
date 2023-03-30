//
//  CustomTextField.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 20.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    private var title: String
    private var text: Binding<String>
    private var prompt: String?
    
    init(title: String, text: Binding<String>, prompt: String? = nil) {
        self.title = title
        self.text = text
        self.prompt = prompt
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                TextField(title, text: text)
                .padding(16)
                .background(Capsule().fill(Color("TextfieldBack")))
            
            if let prompt = prompt {
                Text(prompt)
                    .foregroundColor(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
