//
//  Counter.swift
//  Concurrency
//
//  Created by 장용범 on 2022/08/01.
//

import Foundation

actor Counter {
    var count: Int = 0
    
    func increment() {
        count += 1
    }
}
