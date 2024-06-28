//
//  GoalsView.swift
//  CorrectLifestyle
//
//  Created by Роман on 27.06.2024.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        ZStack {
            Color.main
            VStack{

                HStack {
                    //MARK: - water
                    ZStack {
                        Color.secondMain
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Water")
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(.drop)
                                    .resizable()
                                    .frame(width: 16, height: 21)
                            }
                            
                            Spacer()
                            
                            Text("2 / 2,5")
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                            ProgresBarView(max: 2.5, now: 2)
                        }.padding()
                    }
                    .frame(width: 170, height: 113)
                    .cornerRadius(18)
                    
                    Spacer()
                    
                    //MARK: - Steps
                    ZStack {
                        Color.secondMain
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Steps")
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(.step)
                                    .resizable()
                                    .frame(width: 27, height: 27)
                            }
                            
                            Spacer()
                            
                            Text("20.4k / 30k")
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                            ProgresBarView(max: 30, now: 20.4)
                        }.padding()
                    }
                    .frame(width: 170, height: 113)
                    .cornerRadius(18)
                }
                
                Spacer()
                
                HStack {
                    //MARK: - Add goal buttom
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 48).foregroundStyle(.orangeApp)
                            Text("Add goal")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }).frame(width: 170, height: 67)
                    Spacer()
                    //MARK: - Add training buttom
                    Button(action: {}, label: {
                        ZStack {
                            Color(.main)
                                .cornerRadius(48)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 48)
                                        .stroke(.orangeApp.opacity(0.8), lineWidth: 2.0)
                                }
                            Text("Add training")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }).frame(width: 170, height: 67)
                }
               
            }
        }
    }
}

#Preview {
    GoalsView()
}
