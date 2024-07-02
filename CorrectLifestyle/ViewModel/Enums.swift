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

enum TypeOfCoaching: String, CaseIterable, Identifiable {
    case eveningRun
    case afternoonWorkout
    
    var title: String {
        switch self {
        case .eveningRun:
            return "Evening run"
        case .afternoonWorkout:
            return "Afternoon workout"
        }
    }
    var id: Self {
        self
    }
}

enum Goals: String, CaseIterable, Identifiable {
    case steps
    case water
    
    var title: String {
        switch self {
        case .steps:
            return "Steps"
        case .water:
            return "Water"
        }
    }
    var image: ImageResource {
        switch self {
            
        case .steps:
            return .step
        case .water:
            return .drop
        }
    }
    var id: Self {
        self
    }
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
