//
//  TaskModel.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import Foundation

struct Task : Identifiable{
    
    var id = UUID().uuidString
    var title:String
    var date: Date
    var isCompleted: Bool
}
