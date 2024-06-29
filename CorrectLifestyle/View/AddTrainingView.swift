//
//  AddGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct AddTrainingView: View {
    @StateObject var vm: ViewModel
    @Binding var back: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading) {
                
                //MARK: - Toolbar
                HStack{
                    Button(action: {vm.isPresesentAddTraining.toggle()}, label: {
                        Text("Back")
                            .foregroundStyle(.red)
                    })
                    Spacer()
                    Text("New training")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                
                //MARK: - Selected day
                DropdownPikerView(hint: "Selected day training",
                                  maxWidth: 356,
                                  cornerRadius: 18,
                                  selection: $vm.simpleDayTraining)
                .padding(.vertical)
                
                //MARK: - Ride time
                Text("Ride time")
                    .foregroundStyle(.white.opacity(0.7))
                    .padding(.top, 80)
                    .padding()
                HStack{
                    CustomTextFieldView(placeholder: "Start", text: $vm.simpleTrainingStart)
                    Spacer()
                    CustomTextFieldView(placeholder: "Finish", text: $vm.simpleTrainingEnd)
                }
                Spacer()
                
                Button(action: {vm.isPresesentAddTraining.toggle()}, label: {
                    AddbuttomView()
                })
            }.padding()
        }
    }
}

#Preview {
    AddTrainingView(vm: ViewModel(), back: .constant(true))
}
