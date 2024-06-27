//
//  MainView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack{
               MainToolbarView()
                SwitchView().padding(.vertical)
                Spacer()
                GoalsView()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}
