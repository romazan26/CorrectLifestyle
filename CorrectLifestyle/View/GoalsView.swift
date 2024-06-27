//
//  GoalsView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        ZStack {
            Color.secondMain
            VStack{
                Text("water").foregroundStyle(.white)
                Spacer()
                Text("Add goal").foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    GoalsView()
}
