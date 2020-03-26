//
//  ViewController.swift
//  Expense Application
//
//  Created by Mitul Sarvaiya on 22/03/20.
//  Copyright © 2020 Mitul Sarvaiya. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblExpense: UITableView!
    
    let dateFormatter = DateFormatter();
    
    var expenses = [Expense]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<Expense> = Expense.fetchRequest()
        do{
            expenses = try managedContext.fetch(fetchRequest)
            tblExpense.reloadData()
        }catch{
         print("Error while printing data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddExpenseController,
            let selectedRow = self.tblExpense.indexPathForSelectedRow?.row else{
                return
        }
        destination.foExpense = expenses[selectedRow]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "expenseScreen", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (expenses.count)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Delete", message: "Are you sure want to delete expense", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {
                (UIAlertAction) in
                
                let lsExpense = self.expenses[indexPath.row]
                
                if let managedContext = lsExpense.managedObjectContext{
                    managedContext.delete(lsExpense)
                    
                    do{
                           try  managedContext.save()
                        self.expenses.remove(at: indexPath.row)
                        self.tblExpense.reloadData()
                    }catch{
                        print("error while delete")
                    }
                }
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblExpense.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpenseTableViewCell
        let foExpense = expenses[indexPath.row]
        
        cell.setExpense(name: foExpense.name, amount: foExpense.amount, date: foExpense.date)
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

