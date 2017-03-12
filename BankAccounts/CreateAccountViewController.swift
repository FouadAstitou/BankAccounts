//
//  CreateAccountViewController.swift
//  BankAccounts
//
//  Created by Supervisor on 12-03-17.
//  Copyright © 2017 Nerdvana. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet fileprivate weak var nameTextField: UITextField!
    @IBOutlet fileprivate weak var bankTextField: UITextField!
    @IBOutlet fileprivate weak var numberTextField: UITextField!
    
    var stateController: StateController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveAccountSegue" else {
            return
        }
        let account = Account(name: nameTextField.text ?? "", bank: bankTextField.text ?? "", number: numberTextField.text ?? "", transactions: [])
        stateController.add(account)
    }
}
