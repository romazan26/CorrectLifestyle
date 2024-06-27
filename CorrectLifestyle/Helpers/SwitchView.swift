//
//  SwithView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

enum StateSwitch{
    case Goals
    case Trainings
    case Completedls
}
struct SwitchView: View {
    @State private var state = StateSwitch.Goals
    var body: some View {
        ZStack {
            Color.secondMain
            HStack {
                Button(action: {state = .Goals}, label: {
                    ZStack {
                        Color(state == .Goals ? .orangeApp : .secondMain)
                        Text("Goals").foregroundStyle(state == .Goals ? .white : .gray)
                    }
                })
                .frame(width: 111, height: 38)
                .cornerRadius(10)
                
                Button(action: {state = .Trainings}, label: {
                    ZStack {
                        Color(state == .Trainings ? .orangeApp : .secondMain)
                        Text("Trainings").foregroundStyle(state == .Trainings ? .white : .gray)
                    }
                })
                .frame(width: 111, height: 38)
                .cornerRadius(10)
                
                Button(action: {state = .Completedls}, label: {
                    ZStack {
                        Color(state == .Completedls ? .orangeApp : .secondMain)
                        Text("Completedls").foregroundStyle(state == .Completedls ? .white : .gray)
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
    SwitchView()
}
