//
//  TransactionsViewController.swift
//  BankAccounts
//
//  Created by Supervisor on 12-03-17.
//  Copyright © 2017 Nerdvana. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var account: Account!
    var stateController: StateController!

    fileprivate var dataSource: TransactionsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = account.number.accountNumberFormatting
        navigationItem.title = account.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalLabel.text = account.total.eurosFormatting
        super.viewWillAppear(animated)
        dataSource = TransactionsDataSource(transactions: account.transactions)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
            createTransactionViewController.delegate = self
        }
    }
    
    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
    func add(newTransaction: Transaction) {
        account.transactions.append(newTransaction)
        stateController.update(account)
    }
}
