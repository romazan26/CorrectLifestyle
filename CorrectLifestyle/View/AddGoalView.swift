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
                ZStack{
                    
                    VStack(alignment: .leading) {
                        Text("2/5").foregroundStyle(.white)
                        SwiftUISlider(thumbColor: .white, minTrackColor: .orangeApp, maxTrackColor: .secondMain, value: $vm.simpleMaxWater)
                    }
                    .padding(.horizontal, 10)
                    .offset(y: 80)
                    PickerGoalView(hint: "goal", maxWidth: 356, cornerRadius: 18, selection: $vm.simpleGoal, image: .empty)
                }.padding(.top)
                Spacer()
                
                //MARK: - Add button
                Button(action: {vm.isPresesentAddGoal.toggle()}, label: {
                    AddbuttomView()
                })
            }.padding()
        }
    }
}

#Preview {
    AddGoalView(vm: ViewModel(), back: .constant(true))
}
