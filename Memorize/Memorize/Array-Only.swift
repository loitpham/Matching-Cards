//
//  Array-Only.swift
//  Memorize
//
//  Created by Loi Pham on 4/4/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
