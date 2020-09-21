//
//  TaskCell.swift
//  Todo
//
//  Created by Neskin Ivan on 19.09.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    static let reuseID = "taskCell"
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    
    func setupCell(item: ToDoModel) {
        taskDescription.text = item.taskDeskription
        taskDate.text = "\(item.dateTask)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
