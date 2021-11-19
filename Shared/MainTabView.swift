//
//  MainTabView.swift
//  HKN
//
//  Created by Daniel on 28.01.2021.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NewsView(viewModel: NewsViewModel(newsService: HKItemsService(), pageName: "topstories.json"))
                .tabItem {
                    Image(systemName: "scroll.fill")
                    Text("News")
                }
            JobsView(viewModel: NewsViewModel(newsService: HKItemsService(), pageName: "askstories.json"))
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Ask")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
