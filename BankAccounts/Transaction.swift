//
//  Transaction.swift
//  BankAccounts
//
//  Created by Supervisor on 12-03-17.
//  Copyright © 2017 Nerdvana. All rights reserved.
//

import UIKit

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

extension TransactionCategory {
    struct Appearance {
        let color: UIColor
        let image: UIImage
    }
    
    var appearance: Appearance {
        switch self {
        case .income: return Appearance(color: .lightGrassGreen, image: #imageLiteral(resourceName: "income"))
        case .groceries: return Appearance(color: .seafoamBlue, image: #imageLiteral(resourceName: "groceries"))
        case .utilities: return Appearance(color: .liliac, image: #imageLiteral(resourceName: "utilities"))
        case .home: return Appearance(color: .sunflowerYellow, image: #imageLiteral(resourceName: "home"))
        case .transport: return Appearance(color: .peach, image: #imageLiteral(resourceName: "transport"))
        case .fun: return Appearance(color: .carnation, image: #imageLiteral(resourceName: "fun"))
        }
    }
}

struct Transaction {
    let amount: Float // In a real app that deals with money you should not use floating point numbers!
    let description: String
    let date: Date
    let category: TransactionCategory
}

extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "amount": amount as AnyObject,
            "description": description as AnyObject,
            "date": date as AnyObject,
            "category": category.rawValue as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        date = plist["date"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}
