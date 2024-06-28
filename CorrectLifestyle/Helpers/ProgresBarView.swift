//
//  ProgresBarView.swift
//  CorrectLifestyle
//
//  Created by Роман on 28.06.2024.
//

import SwiftUI

struct ProgresBarView: View {
    var max = 2.5
    var now = 2.1
    private var widhtProgress: CGFloat { 132 / max * now }
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 132, height: 9)
                .foregroundStyle(.gray.opacity(0.5))
            RoundedRectangle(cornerRadius: 10)
                .frame(width: widhtProgress, height: 9)
                .foregroundStyle(.orangeApp)
        }
    }
}

#Preview {
    ProgresBarView()
}
