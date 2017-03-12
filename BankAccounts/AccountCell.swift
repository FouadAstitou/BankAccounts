//
//  AccountCell.swift
//  BankAccounts
//
//  Created by Supervisor on 12-03-17.
//  Copyright © 2017 Nerdvana. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var totalLabel: UILabel!
    @IBOutlet fileprivate weak var bankLabel: UILabel!
    @IBOutlet fileprivate weak var numberLabel: UILabel!
    @IBOutlet fileprivate weak var coloredView: UIView!
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            nameLabel.text = model.name
            totalLabel.text = model.total
            bankLabel.text = model.bank
            numberLabel.text = model.number
            coloredView.backgroundColor = model.color
        }
    }
}

extension AccountCell {
    struct Model {
        let name: String
        let total: String
        let bank: String
        let number: String
        let color: UIColor
        
        init(account: Account, index: Int) {
            name = account.name
            total = account.total.eurosFormatting
            bank = account.bank
            number = account.number.accountNumberFormatting
            color = UIColor.color(for: index)
        }
    }

}
