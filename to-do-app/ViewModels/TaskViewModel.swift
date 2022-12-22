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
        Task(secondId:1, title: "Laundry",  date: Date.now, isCompleted: false),
        Task(secondId:2, title: "Dishes", date: Date.now.addingTimeInterval(-86400), isCompleted: false),
        Task(secondId:3, title: "Grocery", date: Date.now.addingTimeInterval(86400), isCompleted: false)
    ]
    @Published var dates:[Date]=[]
    @Published var today = Date()
    @Published var activeDay = Date()
    @Published var filteredTasks:[Task]?
    @Published var adding: Bool = false
    @Published var removing: Bool = false
    
    init(taskLimit:Int){
        self.taskLimit=taskLimit
        fetchCurrentWeek()
    }
    
    func newTask(title:String, date:Date=Date.now){
        adding.toggle()
        let task = Task(secondId: self.tasks.count+1,title: title, date: date, isCompleted: false)
        tasks.append(task)
    }
    func deleteTask(indexSet:IndexSet){
        removing.toggle()
        //self.filterTasks()
        //tasks.remove(atOffsets: indexSet)
        for index in indexSet{
            let tempTask=filteredTasks?[index]
            for i in 0...tasks.count-1{
                if tasks[i].secondId == tempTask?.secondId{
                    tasks.remove(at: i)
                }
            }
            
        }
        filteredTasks?.remove(atOffsets: indexSet)
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
