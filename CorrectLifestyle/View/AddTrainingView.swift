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
                        .padding(.leading, -30)
                    Spacer()
                }
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    //MARK: - Selected type
                    TypeCoachPickerView(hint: "Selected type training",
                                        maxWidth: 356,
                                        cornerRadius: 18,
                                        selection: $vm.simpleTypeTraining)
                    .padding(.vertical)
                    .offset(y: 80)
                    //MARK: - Selected day
                    DropdownPikerView(hint: "Selected day training",
                                      maxWidth: 356,
                                      cornerRadius: 18,
                                      selection: $vm.simpleDayTraining)
                    .padding(.vertical)
                    
                    
                    VStack{
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
                    }.offset(y: 160)
                }
                //MARK: - Add training button
                Button(action: {
                    vm.addTraining()
                    vm.isPresesentAddTraining.toggle()}, label: {
                    AddbuttomView()
                })
            }.padding()
        }
    }
}

#Preview {
    AddTrainingView(vm: ViewModel(), back: .constant(true))
}
