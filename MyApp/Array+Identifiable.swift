//
//  Array+Identifiable.swift
//  MyApp
//
//  Created by Zihou Wong on 7/29/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                 return index
            }
        }
        return nil
    }
}
