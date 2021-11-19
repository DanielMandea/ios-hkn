//
//  NewsViewModel.swift
//  HKN
//
//  Created by Daniel on 28.01.2021.
//

import Foundation
import Combine
import ListPagination

class NewsViewModel: ObservableObject {
    
    // MARK: - Private
    
    private var newsService: ItemsService
    private var currentPage: Int
    private var itemsInPage: Int
    private var pageName: String
    
    var cancelble: AnyCancellable?
    
    // MARK: - Observed Onject
    
    @Published var items = [Item]()
    
    // MARK: - Init
    
    init(newsService: ItemsService, currentPage: Int = 0, itemsInPage: Int = 10, pageName: String) {
        self.newsService = newsService
        self.currentPage = currentPage
        self.itemsInPage = itemsInPage
        self.pageName = pageName
    }
    
    // MARK: - Helper
    
    func nextRange() -> ClosedRange<Int> {
        currentPage += 1
        let startIndex = currentPage * itemsInPage
        let endIndex = currentPage * itemsInPage == 0 ? itemsInPage : currentPage * (itemsInPage * 2)
        return startIndex...endIndex
    }
    
    func getItems() {
        cancelble = newsService.getItems(in: nextRange(), for: pageName)
            .receive(on: DispatchQueue.main)
            .replaceError(with: [Item]())
            .retry(2)
            .reduce(items) { acumulator, value in
                var arr = [Item]()
                arr.append(contentsOf: acumulator)
                arr.append(contentsOf: value)
                return arr
            }
            .assign(to: \.items, on: self)
    }
    
    func getNewItemsIfThisIsLast(_ item: Item) {
        if items.isLastItem(item) {
            getItems()
        }
    }
    
    deinit {
        cancelble = nil
    }
}

