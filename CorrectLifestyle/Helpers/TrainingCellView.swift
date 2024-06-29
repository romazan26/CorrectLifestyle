//
//  TrainingCellView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI

struct TrainingCellView: View {
    var body: some View {
        ZStack {
            Color.secondMain
            HStack {
                Text("Evening run")
                
                Spacer()
                Text("20:00-21:00")
            }
            .padding()
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .heavy))
        }
        .frame(width: 356, height: 64)
        .cornerRadius(18)
    }
}

#Preview {
    TrainingCellView()
}
