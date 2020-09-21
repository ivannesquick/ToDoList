//
//  ToDoListTableViewController.swift
//  Todo
//
//  Created by Neskin Ivan on 19.09.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//
import UserNotifications
import UIKit

class ToDoListTableViewController: UITableViewController {

    var taskList = [ToDoModel]()
    var addVC = AddViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseID)
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseID, for: indexPath) as! TaskCell
        let taskItem = taskList[indexPath.row]
        cell.setupCell(item: taskItem)
        // Configure the cell...

        return cell
    }
    

}

extension ToDoListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelect" {
            if let vc = segue.destination as? AddViewController {
                vc.title = "New Notification"
                vc.completion = { description, date in
                    DispatchQueue.main.async {
                        self.navigationController?.popToRootViewController(animated: true)
                        let new = ToDoModel(taskDeskription: description, dateTask: date)
                        self.taskList.append(new)
                        self.tableView.reloadData()
                        self.setupNotifications(description: description, date: date)
                    }
                }
            }
        }
    }
}

extension ToDoListTableViewController {
    func setupNotifications(description: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.sound = .default
        content.body = description
        
        let targetDate = date
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                                  from: targetDate),
                                                    repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request, withCompletionHandler: { error in
            if error != nil {
                print("something went wrong")
            }
        })
    }
    
}
