//
//  TaskEditController.swift
//  To-Do Manager
//
//  Created by ALEKSEY SUSLOV on 16.10.2022.
//

import UIKit

class TaskEditController: UITableViewController {
    
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!
    
    // параметры задачи
    var taskText: String = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    
    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: "Важная",
        .normal: "Текущая"
    ]
    
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // обновление текстового поля с названием задачи
        taskTitle?.text = taskText
        
        // обновление метки в соответствии текущим типом
        taskTypeLabel?.text = taskTitles[taskType]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
