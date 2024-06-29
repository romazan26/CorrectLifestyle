//
//  DropdownPikerView.swift
//  CorrectLifestyle
//
//  Created by Роман on 29.06.2024.
//

import SwiftUI


struct DropdownPikerView: View {
    var hint: String
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: String
    @State private var showOptions = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(selection == "" ? hint : selection)
                        .foregroundStyle(selection == "" ? .gray : .white)
                        .lineLimit(1)
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: showOptions ? -100 : 0))
                    
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.height)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                
                
                if showOptions {
                    Optionsview()
                }
            }
            
            .background {
                Color.secondMain
                    .cornerRadius(18)
            }
            
        }.frame(width: maxWidth, height: 67)
        
    }
    
    @ViewBuilder
    func Optionsview() -> some View {
        VStack(spacing: 10){
            ForEach(DayTraining.allCases) { day in
                HStack(spacing: 0) {
                    Text(day.title)
                        .lineLimit(1)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .opacity(selection == day.title ? 1: 0)
                }
                .foregroundStyle(selection == day.title ? Color.white : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = day.title
                        showOptions = false
                    }
                }
            }
            
        }
        .padding(.horizontal, 15)
        
    }
}

#Preview {
    DropdownPikerView(hint: "selected", selection: .constant(""))
}
