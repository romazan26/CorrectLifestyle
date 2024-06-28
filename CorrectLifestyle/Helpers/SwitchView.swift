//
//  SwithView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI


struct SwitchView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.secondMain
            HStack {
                Button(action: {vm.view = .Goals}, label: {
                    ZStack {
                        Color(vm.view == .Goals ? .orangeApp : .secondMain)
                        Text("Goals").foregroundStyle(vm.view == .Goals ? .white : .gray)
                    }
                })
                .frame(width: 111, height: 38)
                .cornerRadius(10)
                
                Button(action: {vm.view = .Trainings}, label: {
                    ZStack {
                        Color(vm.view == .Trainings ? .orangeApp : .secondMain)
                        Text("Trainings").foregroundStyle(vm.view == .Trainings ? .white : .gray)
                    }
                })
                .frame(width: 111, height: 38)
                .cornerRadius(10)
                
                Button(action: {vm.view = .Completedls}, label: {
                    ZStack {
                        Color(vm.view == .Completedls ? .orangeApp : .secondMain)
                        Text("Completedls").foregroundStyle(vm.view == .Completedls ? .white : .gray)
                    }
                })
                .frame(width: 111, height: 38)
                .cornerRadius(10)
            }
        }
        .frame(width: 356, height: 42)
        .cornerRadius(11)
    }
}

#Preview {
    SwitchView(vm: ViewModel())
}
