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
    @IBOutlet weak var mySwitch: UISwitch!
    var completion: ((String, Date) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.setOn(true, animated: true)
    
    }
    
    func checkData() -> Bool {
        if descriptionTextField.text == "" {
            print("Заполните поле описания задачи")
        }
        return true
    }
    
    
    func checkSwitchState()  {
        if self.mySwitch.isOn {
        UserDefaults.standard.set(true, forKey: "switchOn")
        }
    }
    
    @IBAction func saveTaskAction() {
        guard let description = descriptionTextField.text else { return  }
        let date = datePicker.date
        completion?(description, date)
        checkSwitchState()
        self.dismiss(animated: true, completion: nil)
        
    }
}
