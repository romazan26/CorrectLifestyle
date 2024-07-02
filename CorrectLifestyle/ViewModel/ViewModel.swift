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
    
    @Published var noComplitedTraining: [Training] = []
    @Published var complitedTraining: [Training] = []
    
    @Published var view = StateSwitch.Goals
    
    @Published var isPresesentAddGoal = false
    @Published var isPresesentAddTraining = false
    
    @Published var simpleGoal = ""
    @Published var simpleAllSteps = 0.0
    
    @Published var simpleMaxWater = 0.0
    @Published var simpleWater = 0.0
    @Published var simpleMaxSteps = 0.0
    @Published var simpleSteps = 0.0
    
    @Published var simpleDayTraining = ""
    @Published var simpleTypeTraining = ""
    @Published var simpleTrainingStart = ""
    @Published var simpleTrainingEnd = ""

    init(){
        getGoalsWater()
        getGoalsSteps()
        getTrainings()
    }
    
    //MARK: - Create all steps data
    func createAllSteps(){
        goalsSteps.removeAll()
        simpleAllSteps = 0.0
        getGoalsSteps()
        for step in goalsSteps {
            simpleAllSteps += step.steps
        }
        
    }
    
    //MARK: - Create complitedTraining(){
    func createTraining(){
        trainings.removeAll()
        noComplitedTraining.removeAll()
        complitedTraining.removeAll()
        getTrainings()
        for training in trainings {
            if training.complited {
                complitedTraining.append(training)
            }else {
                noComplitedTraining.append(training)
            }
        }
    }
    
    //MARK: - Update water data
    func updateWaterData(with id: ObjectIdentifier){
        let request = NSFetchRequest<GoalWater>(entityName: "GoalWater")
        do{
            try goalsWater = manager.context.fetch(request)
            guard let water = goalsWater.first(where: {$0.id == id}) else {return}
            if water.water < water.maxWater {
                water.water += 0.1
            }
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Update steps data
    func updateStepsData(with id: ObjectIdentifier){
        let request = NSFetchRequest<GoalStep>(entityName: "GoalStep")
        do{
            try goalsSteps = manager.context.fetch(request)
            guard let steps = goalsSteps.first(where: {$0.id == id}) else {return}
            if steps.steps < steps.maxSteps {
                steps.steps += 0.01
            }
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
        createAllSteps()
    }
    
    //MARK: - Update training data
    func updateTraininComplited(with id: ObjectIdentifier){
        let request = NSFetchRequest<Training>(entityName: "Training")
        do{
            try trainings = manager.context.fetch(request)
            guard let training = trainings.first(where: {$0.id == id}) else {return}
            training.complited = true
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
        createTraining()
        view = .Trainings
    }
    
    //MARK: - Clear data function
    func clearData(){
        simpleGoal = ""
        simpleMaxWater = 0.0
        simpleWater = 0.0
        simpleMaxSteps = 0.0
        simpleSteps = 0.0
        simpleDayTraining = ""
        simpleTypeTraining = ""
        simpleTrainingStart = ""
        simpleTrainingEnd = ""
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
        newTraining.nametraining = simpleDayTraining
        newTraining.typeOfCoaching = simpleTypeTraining
        newTraining.start = simpleTrainingStart
        newTraining.end = simpleTrainingEnd
        newTraining.complited = false
        
        save()
        
        createTraining()
        clearData()
    }
    
    func addGoalWater(){
        let newWater = GoalWater(context: manager.context)
        newWater.maxWater = simpleMaxWater
        newWater.water = simpleWater
        save()
        clearData()
    }
    func addGoalSteps(){
        let newSteps = GoalStep(context: manager.context)
        newSteps.maxSteps = simpleMaxSteps
        newSteps.steps = simpleSteps
        save()
        clearData()
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
