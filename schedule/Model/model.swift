//
//  model.swift
//  schedule
//
//  Created by Влад Лиховид on 1/28/19.
//  Copyright © 2019 Влад Лиховид. All rights reserved.
//

import Foundation
import Moya



let groups = ["", "ИН-61", "ИН-62", "ИН-63", "ИН-64", "ИТ-61", "ИТ-62"]
let teachers = ["", "Кузиков Борис Олегович", "Великодный Дмитрий Владимирович", "Берест Олег Борисович"]
let classrooms = ["", "ЕТ-228", "ЕТ-314", "ЕТ-304", "ЕТ-208"]

enum TimeOfLesson: String {
    
    case first = "8:15-9:35"
    case second = "09:50-11:10"
    case third = "11:25-12:45"
    case fourth = "13:25-14:45"
    case fifth = "15:00-16:20"
    case sixth = "16:35-17:55"
    case seventh = "18:00-19:20"
    case eighth = "19:25-20:45"
}

struct Answer {
    
    struct Date {
        let day: Int
        let month: String
        let year: Int
    }
    
    let lessons = [Lesson]()
    
}

struct Lesson {
    
    let name: String
    let type: String
    let nameOflector: String
    let classRoom: String
    let group: String
    let comment: String
}

