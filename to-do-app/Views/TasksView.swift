//
//  TasksView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 21.12.2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var tasksView: TasksViewModel
    var body: some View {
        
        List{
            TaskField()
            Spacer()
            if let tasks = tasksView.filteredTasks{
                if !tasks.isEmpty{
                    ForEach(tasks){task in
                        TaskView(task:task)
                            .padding(.vertical, 10)
                        //.flippedUpsideDown()
                    }
                    .onDelete(perform: tasksView.deleteTask)
                }
                
                
                //.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            
            //            else{
            //                ProgressView()
            //            }
            
        }
        .onChange(of: tasksView.activeDay){item in
            tasksView.filterTasks()
            
        }
        .onChange(of: tasksView.adding){item in
            tasksView.filterTasks()
        }
        .onChange(of: tasksView.removing){item in
            tasksView.filterTasks()
        }
        
        .listStyle(.sidebar)
        .padding(.horizontal, -20)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
