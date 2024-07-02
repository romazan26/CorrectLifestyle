//
//  MainToolbarView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct MainToolbarView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.secondMain
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Steps").foregroundStyle(.gray)
                    Text(String(format: "%.0f", vm.simpleAllSteps * 100000))
                        .foregroundStyle(.white)
                        .font(.system(size: 87, weight: .heavy))
                        .minimumScaleFactor(0.5)
                        
                }
                
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill").foregroundStyle(.gray)
                    }

                
            }
        }
        .onAppear(perform: {
            vm.createAllSteps()
        })
        .frame(width: 393, height: 233)
        .cornerRadius(21)
    }
}

#Preview {
    MainToolbarView(vm: ViewModel())
}
