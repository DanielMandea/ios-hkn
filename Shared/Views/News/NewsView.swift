//
//  NewsView.swift
//  HKN
//
//  Created by Daniel on 28.01.2021.
//

import SwiftUI
import WebKit
import SafariServices
import ListPagination
import ModalView

struct NewsView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            ModalPresenter() {
                List(viewModel.items) { item in
                    #if os(iOS) || os(watchOS) || os(tvOS)
                    ModalLink(destination: iOS_SheetView(item: item)) {
                        ArticleRow(item: item).onAppear {
                            viewModel.getNewItemsIfThisIsLast(item)
                        }
                    }
                    #elseif os(macOS)
                    NavigationLink(destination: macOS_SheetView(item: item)) {
                        ArticleRow(item: item).onAppear {
                            viewModel.getNewItemsIfThisIsLast(item)
                        }
                    }
                    #endif
                    
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    viewModel.getItems()
                }
            }
            .navigationTitle("Today")
        }
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: NewsViewModel(newsService: HKItemsService(), pageName: "topstories.json"))
    }
}
