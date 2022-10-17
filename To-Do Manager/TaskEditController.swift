//
//  TaskEditController.swift
//  To-Do Manager
//
//  Created by ALEKSEY SUSLOV on 16.10.2022.
//

import UIKit

class TaskEditController: UITableViewController {
    
    @IBOutlet var taskStatusSwitch: UISwitch!
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
        
        // обновляем статус задачи
        if taskStatus == .completed {
                taskStatusSwitch.isOn = true
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskTypeScreen" {
            // ссылка на контроллер назначения
            let destination = segue.destination as! TaskTypeController
            // передача выбранного типа
            destination.selectedType = taskType
            // передача обработчика выбора типа
            destination.doAfterTypeSelected = { [unowned self] selectedType in
                taskType = selectedType
                // обновляем метку с текущим типом
                taskTypeLabel?.text = taskTitles[taskType]
            }
        }
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        // получаем актуальные значения
        let title = taskTitle?.text ?? ""
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed : .planned
        
        // вызываем обработчик
        doAfterEdit?(title, type, status)
        
        // возвращаемся к предыдущему экрану
        navigationController?.popViewController(animated: true)
    }

}
