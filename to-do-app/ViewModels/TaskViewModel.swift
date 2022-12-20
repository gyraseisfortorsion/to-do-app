//
//  TaskViewModel.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import Foundation

class TasksViewModel: ObservableObject {
    @Published var taskLimit:Int
    @Published var tasks:[Task] = [
        Task(title: "dishes", description: "do dishes", date: .init(timeIntervalSince1970:1641649097), isCompleted: false),
        Task(title: "dishes", description: "do dishes", date: .init(timeIntervalSince1970:1641646097), isCompleted: false)
    ]
    @Published var dates:[Date]=[]
    
    init(taskLimit:Int){
        self.taskLimit=taskLimit
        fetchCurrentWeek()
    }
    
    func newTask(title:String, description:String, date:Date=Date.now){
        let task = Task(title: title, description: description, date: date, isCompleted: false)
        tasks.append(task)
    }
    func deleteTask(indexSet:IndexSet){
        tasks.remove(atOffsets: indexSet)
    }
    func fetchCurrentWeek() {
        
        let cal = Calendar.current
        let week = cal.dateInterval(of: .weekOfMonth, for: Date())
        guard let firstWeek = week?.start else { return }
        
        for i in 1...7 {
            if let weekday = cal.date(byAdding: .day, value: i, to: firstWeek){
                dates.append(weekday)
            }
        }
        
    }
    
    
}
