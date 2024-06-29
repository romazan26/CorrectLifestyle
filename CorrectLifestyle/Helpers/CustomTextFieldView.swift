//
//  CustomTextFieldView.swift
//  Movieplanner
//
//  Created by Роман on 07.06.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .center) {
            Color.secondMain
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .cornerRadius(12)
        .frame(width: 164, height: 67)
    }
}

#Preview {
    CustomTextFieldView(placeholder: "Film title", text: .constant(""))
}
