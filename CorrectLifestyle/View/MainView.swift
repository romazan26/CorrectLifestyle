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
                    GoalsView().padding()
                case .Trainings:
                    TrainingsView().padding()
                case .Completedls:
                    CompletedlsView().padding()
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}
