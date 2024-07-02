//
//  StepGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct StepGoalView: View {
    let steps: GoalStep
    @StateObject var vm: ViewModel
    
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
                
                Text("\(vm.createValueSteps(staps: steps.steps))k / \(vm.createValueSteps(staps: steps.maxSteps))k")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                ProgresBarView(max: steps.maxSteps, now: steps.steps)
            }.padding()
        }
        .onTapGesture {
            vm.updateStepsData(with: steps.id)
        }
        .frame(width: 170, height: 113)
        .cornerRadius(18)
    }
}

//#Preview {
//    StepGoalView()
//}
