//
//  TaskViewModel.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import Foundation
import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var taskLimit:Int
    @Published var tasks:[Task] = [
        Task(title: "Laundry", date: Date.now, isCompleted: false),
        Task(title: "Dishes", date: Date.now.addingTimeInterval(-86400), isCompleted: false),
        Task(title: "Grocery", date: Date.now.addingTimeInterval(86400), isCompleted: false)
    ]
    @Published var dates:[Date]=[]
    @Published var today = Date()
    @Published var activeDay = Date()
    @Published var filteredTasks:[Task]?
    
    init(taskLimit:Int){
        self.taskLimit=taskLimit
        fetchCurrentWeek()
    }
    
    func newTask(title:String, date:Date=Date.now){
        let task = Task(title: title, date: date, isCompleted: false)
        tasks.append(task)
    }
    func deleteTask(indexSet:IndexSet){
        filteredTasks?.remove(atOffsets: indexSet)
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
    
    func isToday(date:Date)->Bool{
        let Calendar = Calendar.current
        
        return Calendar.isDate(today, inSameDayAs: self.today)
    }
    
    func filterTasks(){
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
             
            let filtered = self.tasks.filter{
                return calendar.isDate($0.date, inSameDayAs: self.activeDay)
            }
            
            DispatchQueue.main.async{
                withAnimation{
                    self.filteredTasks=filtered
                    
                }
            }
        }
    }
    
    
}
