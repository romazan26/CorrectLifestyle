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
    
    @Published var isPresesentAddGoal = false
    @Published var isPresesentAddTraining = false
    
    @Published var simpleDayTraining = ""
    @Published var simpleGoal = ""
    
    @Published var simpleMaxWater = 0.0
    @Published var simpleWater = 0.0
    @Published var simpleMaxSteps = 0.0
    @Published var simpleSteps = 0.0
    
    @Published var simpleTrainingName = ""
    @Published var simpleTrainingStart = ""
    @Published var simpleTrainingEnd = ""

    init(){
        getGoalsWater()
        getGoalsSteps()
        getTrainings()
    }
    //MARK: - Create slider data
    func createValueWater(water: Double) -> String{
        return String(format: "%.1f", water * 5)
    }
    func createValueSteps(staps: Double) -> String{
        return String(format: "%.1f", staps * 100) 
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
    
    func addGoalWater(){
        let newWater = GoalWater(context: manager.context)
        newWater.maxWater = simpleMaxWater
        newWater.water = simpleWater
        save()
    }
    func addGoalSteps(){
        let newSteps = GoalStep(context: manager.context)
        newSteps.maxSteps = simpleMaxSteps
        newSteps.steps = simpleSteps
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
