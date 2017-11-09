//
//  ArrayExtn.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/3/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        precondition(from != to && indices.contains(from) && indices.contains(to), "invalid indexes")
        insert(remove(at: from), at: to)
    }
}
