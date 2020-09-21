//
//  AddViewController.swift
//  Todo
//
//  Created by Neskin Ivan on 19.09.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var completion: ((String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkData() -> Bool {
        if descriptionTextField.text == "" {
            print("Заполните поле описания задачи")
        }
        return true
    }
    
    @IBAction func saveTaskAction() {
        
        guard var description = descriptionTextField.text else { return  }
        var date = datePicker.date
        completion?(description, date)
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
