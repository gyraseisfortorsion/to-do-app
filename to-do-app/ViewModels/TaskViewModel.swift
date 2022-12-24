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
        Task(secondId:0, title: "Laundry",  date: Date.now, isCompleted: false),
        Task(secondId:1, title: "Dishes", date: Date.now.addingTimeInterval(-86400), isCompleted: false),
        Task(secondId:2, title: "Grocery", date: Date.now.addingTimeInterval(86400), isCompleted: false)
    ]
    @Published var dates:[Date]=[]
    @Published var today = Date()
    @Published var activeDay = Date.now
    @Published var filteredTasks:[Task]?
    @Published var adding: Bool = false
    @Published var removing: Bool = false
    @Published var nextTaskId: Int = 3
    @Published var maxTaskId: Int = 2
    @Published var isRest:Bool = false
    
    init(taskLimit:Int){
        self.taskLimit=taskLimit
        fetchCurrentWeek()
    }
    
    func newTask(title:String, date:Date=Date.now){
        
        adding.toggle()
//        nextTaskId+=1
        if nextTaskId>=maxTaskId{
            maxTaskId=nextTaskId
        }
        let task = Task(secondId: nextTaskId,title: title, date: date, isCompleted: false)
        tasks.append(task)
        nextTaskId+=1

    }
    func deleteTask(indexSet:IndexSet){
   
        //self.filterTasks()
        //tasks.remove(atOffsets: indexSet)
        
        for index in indexSet{
            let tempTask=filteredTasks?[index]
            nextTaskId=tempTask?.secondId ?? tasks.count
            if nextTaskId==maxTaskId{
                maxTaskId-=1
            }
           
                
                    //filteredTasks?.remove(atOffsets: indexSet)
            tasks.remove(at: tasks.firstIndex(where: {  $0.secondId == tempTask?.secondId })!)
                   
                
            
            
 
        }
        
        removing.toggle()
        //filteredTasks?.remove(atOffsets: indexSet)
    }
    func fetchCurrentWeek() {
        
        let cal = Calendar.current
        let week = cal.dateInterval(of: .weekOfMonth, for: Date.now.addingTimeInterval(-86400))
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
            
//            if (self.isRest) {
//                filtered = self.tasks.filter{
//                    return calendar.isDate($0.date, inSameDayAs: self.activeDay)
//                }
//            }
            
            DispatchQueue.main.async{
                withAnimation{
                    self.filteredTasks=filtered
                }
            }
        }
    }
    
    
}
