//
//  TrainingsView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct TrainingsView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Today").foregroundStyle(.gray)
                        ForEach(vm.noComplitedTraining) { trainng in
                            if trainng.nametraining == DayTraining.today.title {
                                TrainingCellView(vm: vm, training: trainng)
                            }
                        }

                        Text("Yesterday").foregroundStyle(.gray)
                        ForEach(vm.noComplitedTraining) { trainng in
                            if trainng.nametraining == DayTraining.yesterday.title {
                                TrainingCellView(vm: vm, training: trainng)
                            }
                        }
                        Spacer()
                        //MARK: - bottom toolbar
                       
                    }
                    
                }
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
                    }).frame(width: 170, height: 67)
                }
            }
        }
        .onAppear(perform: {
            vm.createTraining()
        })
        .animation(.smooth, value: vm.noComplitedTraining)
    }
}

#Preview {
    TrainingsView(vm: ViewModel())
}
