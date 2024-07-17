//
//  TrainingCellView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI

struct TrainingCellView: View {
    @StateObject var vm: ViewModel
    let training: Training
    var body: some View {
        ZStack {
            Color(training.complited ? .orangeApp : .secondMain)
            HStack {
                Text("\(training.typeOfCoaching ?? "")")
                
                Spacer()
                Text("\(Dateformatter(date: training.timeStart ?? Date()))-\(Dateformatter(date: training.timeEnd ?? Date()))")
            }
            .padding()
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .heavy))
        }
        .onLongPressGesture(perform: {
            vm.updateTraininComplited(with: training.id)
        })
        .frame(width: 356, height: 64)
        .cornerRadius(18)
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}

#Preview {
    TrainingCellView(vm: ViewModel(), training: Training())
}
