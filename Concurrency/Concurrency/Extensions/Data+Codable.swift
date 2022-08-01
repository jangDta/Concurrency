//
//  Data+Codable.swift
//  Concurrency
//
//  Created by 장용범 on 2022/08/01.
//

import Foundation

extension Data {
    func decode<T: Decodable>(to type: T.Type, _ completion: (T) -> Void) {
        let decodedValue = try! JSONDecoder().decode(T.self, from: self)
        completion(decodedValue)
    }
    
    func decode<T: Decodable>(to type: T.Type) async throws -> T {
        let decodedValue = try JSONDecoder().decode(T.self, from: self)
        return decodedValue
    }
}

