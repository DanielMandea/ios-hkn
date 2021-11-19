//
//  SheetView.swift
//  HKN
//
//  Created by Daniel on 01.02.2021.
//

import SwiftUI

struct iOS_SheetView: View {
    
    @State private var isLoading: Bool = true
    
    var item: Item?
    
    var body: some View {
        ZStack {
            VStack {
                Color.gray
                    .frame(width: 100, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.top, 15)
                HStack {
                    ScoreView(score: item?.score ?? 0, font: .subheadline)
                        .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(item?.title ?? "Unknown Story")
                        .font(.subheadline)
                        .padding([.bottom,.trailing], 5)
                }
                WebView(isLoading: $isLoading, url: item?.url)
                    .background(Color.clear)
            }
            .background(Color.clear)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .background(Color.clear)
                .isHidden(isLoading)
        }
    }
    
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if !isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        iOS_SheetView()
    }
}
