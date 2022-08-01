//
//  BankAccount.swift
//  Concurrency
//
//  Created by 장용범 on 2022/08/01.
//

import Foundation

actor BankAccount {
    let accountNumber: Int
    var balance: Double
    
    init(accountNumber: Int, initialDeposit: Double) {
        self.accountNumber = accountNumber
        self.balance = initialDeposit
    }
}

extension BankAccount {
    enum BankError: Error {
        case insufficientFunds
    }
    
    func transfer(amount: Double, to other: BankAccount) async throws {
        if amount > self.balance {
            throw BankError.insufficientFunds
        }
        
        print("Transferring \(amount) from \(accountNumber) to \(other.accountNumber)")
        
        self.balance = balance - amount
        await other.deposit(amount: amount)
    }
}

extension BankAccount {
    func deposit(amount: Double) async {
        assert(amount >= 0, "0보다 커야됨")
        balance += amount
    }
}

/***
    Actor-Isolated
    - Actor 내부에 선언된 친구들은 Actor자신(self)을 통해서만 접근할 수 있음
 
    Cross Actor Reference
    - Actor 외부에서 Actor-Isolated를 참조하는 것
    - let(불변상태)은 바로 접근 가능 (* 같은 Module끼리만 가능, 다른 /Module이면 await 써야함)
    - async 함수로 호출하여 수행 가능
 */
