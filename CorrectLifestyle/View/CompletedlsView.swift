//
//  CompletedlsView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct CompletedlsView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Today").foregroundStyle(.gray)
                        ForEach(vm.complitedTraining) { trainng in
                            if trainng.nametraining == DayTraining.today.title {
                                TrainingCellView(vm: vm, training: trainng)
                            }
                        }
                        
                        Text("Yesterday").foregroundStyle(.gray)
                        ForEach(vm.complitedTraining) { trainng in
                            if trainng.nametraining == DayTraining.yesterday.title {
                                TrainingCellView(vm: vm, training: trainng)
                            }
                        }
                        Spacer()
                        //MARK: - bottom toolbar
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CompletedlsView(vm: ViewModel())
}
