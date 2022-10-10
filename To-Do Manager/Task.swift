//
//  Task.swift
//  To-Do Manager
//
//  Created by ALEKSEY SUSLOV on 10.10.2022.
//

import Foundation

// тип задачи
enum TaskPriority {
    // текущая
    case normal
    // важная
    case important
}

// состояние задачи
enum TaskStatus {
    // запланированная
    case planned
    // завершенная
    case completed
}
