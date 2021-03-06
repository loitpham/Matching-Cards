//
//  Array-Identifiable.swift
//  Memorize
//
//  Created by Loi Pham on 4/4/21.
//

import Foundation

extension Array where Element : Identifiable {
    func firstIndex(matching: Element) -> Int? { // Optional<Int>
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // TODO: bogus
    }
}
