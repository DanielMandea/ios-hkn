//
//  JobRow.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI

struct JobRow: View {
    
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                ScoreView(score: item.score ?? 0)
                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(item.title ?? "Unknown Story")
                    .font(.headline)
                Spacer()
            }
            Text(item.text?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? "Some text")
                .font(.subheadline)
            Text("Story By @\(item.by ?? "John Doe")")
                .padding(.top, 1)
                .font(.footnote)
                .foregroundColor(ScoreView.color(for: item.score ?? 0))
        }
    }
}

struct JobRow_Previews: PreviewProvider {
    static var previews: some View {
        JobRow(item: Item(by: "Jan", score: 38, time: Date(), title: "Some", type: "Story", url: "Some"))
    }
}
