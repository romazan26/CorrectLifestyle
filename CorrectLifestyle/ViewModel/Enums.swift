//
//  Enums.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import Foundation

enum StateSwitch{
    case Goals
    case Trainings
    case Completedls
}

enum DayTraining: String, CaseIterable, Identifiable {
    case today
    case yesterday
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
            
        case .today:
            return "Today"
        case .yesterday:
            return "Yesteday"
        }
    }
}
