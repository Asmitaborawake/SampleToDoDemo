//
//  ToDoCell.swift
//  SampleToDoDemo
//
//  Created by asmita.borawake on 06/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoImage: UIImageView!
    @IBOutlet weak var toDoTitle: UILabel!
    @IBOutlet weak var toDoDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
