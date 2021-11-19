//
//  HKItemsService.swift
//  HKN
//
//  Created by Daniel on 28.01.2021.
//

import Foundation
import Combine

struct HKItemsService {
    
    // MARK: - Private
    
    private let baseURL:String
    
    // MARK: - Init
    
    init(baseURL: String = "https://hacker-news.firebaseio.com/v0") {
        self.baseURL = baseURL
    }
    
    // MARK: - Helper Functions
    
    func just(url: String) -> AnyPublisher<URL, Error> {
        Just(URL(string: url))
            .compactMap { $0 }
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}

// MARK: - NewsService

extension HKItemsService: ItemsService {
    func getItem(by id: Int) -> AnyPublisher<Item, Error> {
        just(url: "\(baseURL)/item/\(id).json?print=pretty")
            .flatMap {
                URLSession.shared.dataTaskPublisher(for: $0)
                    .receive(on: RunLoop.main)
                    .map(\.data)
                    .decode(type: Item.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    func getIds(for path: String) -> AnyPublisher<[Int], Error> {
        just(url: "\(baseURL)/\(path)?print=pretty")
            .flatMap {
                URLSession.shared.dataTaskPublisher(for: $0)
                    .receive(on: RunLoop.main)
                    .map(\.data)
                    .decode(type: [Int].self, decoder: JSONDecoder())
            }.eraseToAnyPublisher()
    }
    
    
    func getItems(in range: ClosedRange<Int>, for path: String) -> AnyPublisher<[Item], Error> {
        getIds(for: path).flatMap {
            getItems(in: range, from: $0)
        }.eraseToAnyPublisher()
    }
    
    func getItems(in range: ClosedRange<Int>, from ids:[Int]) -> AnyPublisher<[Item], Error> {
        ids.subArray(in: range).publisher
            .flatMap { value in
                getItem(by: value)
            }.reduce([Item]()) { acumulator, value in
                var arr = [Item]()
                arr.append(contentsOf: acumulator)
                arr.append(value)
                return arr
            }.eraseToAnyPublisher()
    }
}
