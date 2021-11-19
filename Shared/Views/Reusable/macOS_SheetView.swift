//
//  SheetView.swift
//  HKN
//
//  Created by Daniel on 01.02.2021.
//

import SwiftUI

struct macOS_SheetView: View {
    
    @State private var isLoading: Bool = true
    
    var item: Item?
    
    var body: some View {
        VStack {
            HStack {
                ScoreView(score: item?.score ?? 0, font: .subheadline)
                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(item?.title ?? "Unknown Story")
                    .font(.subheadline)
                    .padding([.bottom,.trailing], 5)
            }
            Spacer()
            ZStack {
                macOS_WebView(isLoading: $isLoading, url: item?.url)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .background(Color.clear)
                    .isHidden(isLoading)
            }
            Spacer()
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
        macOS_SheetView()
    }
}

