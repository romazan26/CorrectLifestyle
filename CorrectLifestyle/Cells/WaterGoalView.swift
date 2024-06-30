//
//  WaterGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct WaterGoalView: View {
    @StateObject var vm: ViewModel
    let water: GoalWater
    var body: some View {
        ZStack {
            Color.secondMain
            VStack(alignment: .leading) {
                HStack {
                    Text("Water")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(.drop)
                        .resizable()
                        .frame(width: 16, height: 21)
                }
                
                Spacer()
                
                Text("\(vm.createValueWater(water: water.water)) / \(vm.createValueWater(water: water.maxWater))")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                ProgresBarView(max: water.maxWater, now: water.water)
            }.padding()
        }
        .frame(width: 170, height: 113)
        .cornerRadius(18)
    }
}

//#Preview {
//    WaterGoalView(water: W)
//}
