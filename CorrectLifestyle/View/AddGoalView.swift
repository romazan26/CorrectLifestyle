//
//  AddgoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI

struct AddGoalView: View {
    @StateObject var vm: ViewModel
    @Binding var back: Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddGoalView(vm: ViewModel(), back: .constant(true))
}
