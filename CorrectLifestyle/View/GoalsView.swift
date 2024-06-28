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
            Color.main
            VStack{
                HStack {
                    //MARK: - water
                    WaterGoalView(maxWater: 5, nowWater: 2)
                    Spacer()
                    //MARK: - Steps
                    StepGoalView(maxSteps: 30, nowSteps: 20.4)
                }
                Spacer()
                HStack {
                    //MARK: - Add goal buttom
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 48).foregroundStyle(.orangeApp)
                            Text("Add goal")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }).frame(width: 170, height: 67)
                    
                    Spacer()
                    
                    //MARK: - Add training buttom
                    Button(action: {}, label: {
                        ZStack {
                            Color(.main)
                                .cornerRadius(48)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 48)
                                        .stroke(.orangeApp.opacity(0.8), lineWidth: 2.0)
                                }
                            Text("Add training")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }).frame(width: 170, height: 67)
                }
            }
        }
    }
}

#Preview {
    GoalsView()
}
