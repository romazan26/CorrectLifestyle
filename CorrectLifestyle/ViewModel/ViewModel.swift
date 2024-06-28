//
//  ViewModel.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

enum StateSwitch{
    case Goals
    case Trainings
    case Completedls
}

import Foundation

final class ViewModel: ObservableObject{
    @Published var view = StateSwitch.Goals
}
