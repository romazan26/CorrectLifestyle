//
//  MainView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack {
            //MARK: - background
            Color.main.ignoresSafeArea()
            VStack{
                //MARK: - ToolBar
               MainToolbarView()
                
                //MARK: - Switch
                SwitchView(vm: vm).padding(.vertical)
                
                Spacer()
                
                //MARK: - View
                switch vm.view {
                case .Goals: 
                    GoalsView(vm: vm).padding()
                case .Trainings:
                    TrainingsView(vm: vm).padding()
                case .Completedls:
                    CompletedlsView().padding()
                }
            }.ignoresSafeArea()
        }
        .sheet(isPresented: $vm.isPresesentAddTraining, content: {
            AddTrainingView(vm: vm, back: $vm.isPresesentAddTraining)
        })
        .sheet(isPresented: $vm.isPresesentAddGoal, content: {
            AddGoalView(vm: vm, back: $vm.isPresesentAddGoal)
        })
    }
}

#Preview {
    MainView()
}
