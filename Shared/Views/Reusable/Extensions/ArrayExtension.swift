//
//  ArrayExtension.swift
//  HKN
//
//  Created by Daniel on 31.01.2021.
//

import Foundation

extension Array {
    func subArray(in range: ClosedRange<Int>) -> Array {
        guard range.upperBound < indices.upperBound else { return Array(self[range.lowerBound ... indices.upperBound - 1]) }
        return Array(self[range])
    }
}
