//
//  StepGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct StepGoalView: View {
    var maxSteps: Double = 30
    var nowSteps: Double = 20.4
    
    var body: some View {
        ZStack {
            Color.secondMain
            VStack(alignment: .leading) {
                HStack {
                    Text("Steps")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(.step)
                        .resizable()
                        .frame(width: 27, height: 27)
                }
                
                Spacer()
                
                Text("\(nowSteps.formatted())k / \(maxSteps.formatted())k")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                ProgresBarView(max: maxSteps, now: nowSteps)
            }.padding()
        }
        .frame(width: 170, height: 113)
        .cornerRadius(18)
    }
}

#Preview {
    StepGoalView()
}
