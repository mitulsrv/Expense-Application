//
//  ExpenseTableViewCell.swift
//  Expense Application
//
//  Created by Mitul Sarvaiya on 22/03/20.
//  Copyright © 2020 Mitul Sarvaiya. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setExpense(name: String?, amount:Double, date:Date?){
        lblName.text = name
        lblAmount.text = "\(amount)"
        lblDate.text = "\(date!)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
