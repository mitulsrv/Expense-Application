//
//  AddExpenseController.swift
//  Expense Application
//
//  Created by Mitul Sarvaiya on 22/03/20.
//  Copyright © 2020 Mitul Sarvaiya. All rights reserved.
//

import UIKit

class AddExpenseController: UIViewController {

    @IBOutlet weak var fiBtnAdd: UIButton!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var dtDatePicker: UIDatePicker!
    @IBOutlet weak var txtName: UITextField!
    
    var foExpense:Expense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        txtName.text = foExpense?.name
        
        if let amount = foExpense?.amount{
            txtAmount.text = "\(amount)"
        }
        
        if let date = foExpense?.date{
            dtDatePicker.date = date
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnAdd(_ sender: Any) {
        
        let name = txtName.text
        let amount = txtAmount.text ?? ""
        let date = dtDatePicker.date
        let doubleAmount = Double(amount) ?? 0.0
        
        //Update expense
        var expense:Expense?
        
        if let existingExpense = foExpense {
            //get values from control object
            existingExpense.name = name
            existingExpense.amount = doubleAmount
            existingExpense.date = date
            
            expense = existingExpense
        }else{
            //if not existing expense then insert
            expense = Expense(name: name, amount: doubleAmount, date: date)

        }
        
        if let foExpenses = expense
        {
            do{
                let managedContext = foExpenses.managedObjectContext
                try managedContext?.save()
            }catch{
                print("something went wrong")
            }
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
