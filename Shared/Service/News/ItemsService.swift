//
//  ItemsService.swift
//  HKN
//
//  Created by Daniel on 28.01.2021.
//

import Foundation
import Combine

protocol ItemsService {
    func getItem(by id: Int) -> AnyPublisher<Item, Error>
    func getIds(for path: String) -> AnyPublisher<[Int], Error>
    func getItems(in range: ClosedRange<Int>, for path: String) -> AnyPublisher<[Item], Error>
}
