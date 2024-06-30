//
//  AddgoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI

struct AddGoalView: View {
    @StateObject var vm: ViewModel
    @Binding var back: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Toolbar
                HStack{
                    Button(action: {vm.isPresesentAddGoal.toggle()}, label: {
                        Text("Back")
                            .foregroundStyle(.red)
                    })
                    Spacer()
                    Text("New goal")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, -30)
                    Spacer()
                    
                }
                //MARK: - Grope os Sliders
                ZStack{
                    if vm.simpleGoal == Goals.water.title{
                        //MARK: - Water slider
                        VStack(alignment: .leading) {
                            Text("\(vm.createValueWater(water: vm.simpleMaxWater))/5").foregroundStyle(.white)
                            SwiftUISlider(thumbColor: .white, minTrackColor: .orangeApp, maxTrackColor: .secondMain, value: $vm.simpleMaxWater)
                        }
                        .padding(.horizontal, 10)
                        .offset(y: 80)
                    }else if vm.simpleGoal == Goals.steps.title {
                        
                        //MARK: - Steps slider
                        VStack(alignment: .leading) {
                            Text("\(vm.createValueSteps(staps: vm.simpleMaxSteps))k/100k").foregroundStyle(.white)
                            SwiftUISlider(thumbColor: .white, minTrackColor: .orangeApp, maxTrackColor: .secondMain, value: $vm.simpleMaxSteps)
                        }
                        .padding(.horizontal, 10)
                        .offset(y: 80)
                    }
                    
                    PickerGoalView(hint: "goal", maxWidth: 356, cornerRadius: 18, selection: $vm.simpleGoal, image: .empty)
                }.padding(.top)
                Spacer()
                
                //MARK: - Add button
                Button(action: {
                    if vm.simpleGoal == Goals.water.title {
                        vm.addGoalWater()
                    } else if vm.simpleGoal == Goals.steps.title {
                        vm.addGoalSteps()
                    }
                    vm.isPresesentAddGoal.toggle()}, label: {
                    AddbuttomView()
                })
            }.padding()
        }
    }
}

#Preview {
    AddGoalView(vm: ViewModel(), back: .constant(true))
}
