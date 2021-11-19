//
//  ScoreView.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var font: Font = .title
    
    var body: some View {
        ScoreView.color(for: score)
            .cornerRadius(20)
            .overlay(
                VStack(spacing: 10) {
                    Text("\(score)").font(font).foregroundColor(.white)
                }
            )
            .padding(10)
        
    }
    
   static func color(for score: Int) -> Color {
        var color:Color = .green
        switch score {
        case 0:
            color = .gray
        case 1..<10:
            color = .yellow
        case 10..<20:
            color = .orange
        case 20..<40:
            color = .blue
        case 40..<80 :
            color = .blue
        default:
            color = .red
        }
        return color
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 10)
    }
}
