//
//  WaterGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct WaterGoalView: View {
    var maxWater: Double = 2.5
    var nowWater: Double = 2
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
                
                Text("\(nowWater.formatted()) / \(maxWater.formatted())")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                ProgresBarView(max: maxWater, now: nowWater)
            }.padding()
        }
        .frame(width: 170, height: 113)
        .cornerRadius(18)
    }
}

#Preview {
    WaterGoalView()
}
