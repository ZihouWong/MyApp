//
//  Array+Only.swift
//  MyApp
//
//  Created by Zihou Wong on 8/1/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }

}
