//
//  MainToolbarView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct MainToolbarView: View {
    var body: some View {
        ZStack {
            Color.secondMain
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Steps").foregroundStyle(.gray)
                    Text("20416")
                        .foregroundStyle(.white)
                        .font(.system(size: 87, weight: .heavy))
                }
                
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill").foregroundStyle(.gray)
                    }

                
            }
        }
        .frame(width: 393, height: 233)
        .cornerRadius(21)
    }
}

#Preview {
    MainToolbarView()
}
