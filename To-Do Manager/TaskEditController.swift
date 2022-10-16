//
//  TaskEditController.swift
//  To-Do Manager
//
//  Created by ALEKSEY SUSLOV on 16.10.2022.
//

import UIKit

class TaskEditController: UITableViewController {
    
    // параметры задачи
    var taskText: String = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
