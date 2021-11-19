//
//  ArticleRow.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI

struct ArticleRow: View {
    
    var item: Item
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            ScoreView(score: item.score ?? 0)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text(item.title ?? "Unknown Story")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("@\(item.by ?? "John Doe")")
                    .font(.footnote)
            }
            Spacer()
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(item: Item(by: "Jan", score: 38, time: Date(), title: "Some", type: "Story", url: "Some"))
    }
}
