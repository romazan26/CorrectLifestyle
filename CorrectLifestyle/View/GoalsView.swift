//
//  GoalsView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct GoalsView: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color.main
            VStack{
                HStack {
                    //MARK: - water
                    ScrollView{
                        ForEach(vm.goalsWater) { water in
                            WaterGoalView(vm: vm, water: water)
                        }
                        
                    }
                    Spacer()
                    //MARK: - Steps
                    ScrollView{
                        ForEach(vm.goalsSteps) { steps in
                            StepGoalView(steps: steps, vm: vm)
                        }
                        
                    }
                    
                }
                Spacer()
                
                //MARK: - Grope of AddButton
                HStack {
                    //MARK: - Add goal buttom
                    Button(action: {vm.isPresesentAddGoal.toggle()}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 48).foregroundStyle(.orangeApp)
                            Text("Add goal")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }).frame(width: 170, height: 67)
                    
                    Spacer()
                    
                    //MARK: - Add training buttom
                    Button(action: {vm.isPresesentAddTraining.toggle()}, label: {
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
                    })
                    .frame(width: 170, height: 67)
                }.padding(.vertical)
            }
        }
    }
}

#Preview {
    GoalsView(vm: ViewModel())
}
