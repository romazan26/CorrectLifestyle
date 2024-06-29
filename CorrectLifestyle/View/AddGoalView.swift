//
//  AddGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct AddGoalView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        ZStack {
            VStack {
                DropdownPikerView(hint: "Selected day training", maxWidth: 356, cornerRadius: 18, selection: $vm.simpleDayTraining)
            }
        }
    }
}

#Preview {
    AddGoalView(vm: ViewModel())
}
