//
//  ViewController.swift
//  Concurrency
//
//  Created by 장용범 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData { data in
            data.decode(to: [Info].self) { decodedValue in
//                print(decodedValue)
            }
        }
        
        Task {
            await initialize()
        }
        
        Task {
            let counter = Counter()
            await counter.increment()
        }
        
        let bankAccount = BankAccount(accountNumber: 10, initialDeposit: 20)
        
        Task {
            await bankAccount.deposit(amount: 200)
        }
    }
    
    private func getData(_ completion: (Data) -> Void) {
        let url = URL(string: "https://api.sampleapis.com/avatar/info")!
        let data = try! Data(contentsOf: url)
        completion(data)
    }
    
    private func getData() async throws -> Data {
        let url = URL(string: "https://api.sampleapis.com/avatar/info")!
        let data = try Data(contentsOf: url)
        return data
    }
    
    private func initialize() async {
        do {
            let data = try await getData()
            let decodedValue = try await data.decode(to: [Info].self)
        } catch {
            // Error
        }
    }
}

