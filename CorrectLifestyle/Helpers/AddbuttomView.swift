//
//  AddbuttomView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI

struct AddbuttomView: View {
    var body: some View {
        ZStack {
            Color.orangeApp
            Text("Add new")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .heavy))
        }
        .frame(width: 356, height: 67)
        .cornerRadius(48)
    }
}

#Preview {
    AddbuttomView()
}
