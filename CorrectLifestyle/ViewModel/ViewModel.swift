//
//  ViewModel.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//



import Foundation
import CoreData

final class ViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var goalsWater: [GoalWater] = []
    @Published var goalsSteps: [GoalStep] = []
    @Published var trainings: [Training] = []
    
    @Published var view = StateSwitch.Goals
    @Published var selectedDay: DayTraining = .today
    
    
    @Published var isPresesentAddGoal = false
    
    @Published var simpleDayTraining = ""
    @Published var simpleTrainingName = ""
    @Published var simpleTrainingStart = ""
    @Published var simpleTrainingEnd = ""

    init(){
        getGoalsWater()
        getGoalsSteps()
        getTrainings()
    }
    
    //MARK: - Add data
    func addTraining(){
        let newTraining = Training(context: manager.context)
        newTraining.nametraining = simpleTrainingName
        newTraining.start = simpleTrainingStart
        newTraining.end = simpleTrainingEnd
        newTraining.complited = false
        
        save()
    }
    
    //MARK: Get data
    func getGoalsWater(){
        let request = NSFetchRequest<GoalWater>(entityName: "GoalWater")
        do{
            goalsWater = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getGoalsSteps(){
        let request = NSFetchRequest<GoalStep>(entityName: "GoalStep")
        do{
            goalsSteps = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getTrainings(){
        let request = NSFetchRequest<Training>(entityName: "Training")
        do{
            trainings = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){
        goalsSteps.removeAll()
        goalsWater.removeAll()
        trainings.removeAll()
        manager.save()
        getGoalsWater()
        getGoalsSteps()
        getTrainings()
    }
    
}
