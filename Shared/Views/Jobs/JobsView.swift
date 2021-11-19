//
//  JobsView.swift
//  HKN
//
//  Created by Daniel on 29.01.2021.
//

import SwiftUI

struct JobsView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                JobRow(item: item)
                    .onAppear {
                        viewModel.getNewItemsIfThisIsLast(item)
                    }
            }.onAppear {
                viewModel.getItems()
            }
            .navigationTitle("Jobs")
        }
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView(viewModel: NewsViewModel(newsService: HKItemsService(), pageName: "jobs.json"))
    }
}
