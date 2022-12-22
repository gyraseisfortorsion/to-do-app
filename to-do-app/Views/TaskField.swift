//
//  TaskField.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 21.12.2022.
//

import SwiftUI

struct TaskField: View {
    @State var enteredtext:String=""
    @EnvironmentObject var tasks: TasksViewModel
    @FocusState private var isFocused: Bool
    var body: some View {
        TextField("Add new task", text: $enteredtext)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true
            }
            .multilineTextAlignment(.center)
            .onSubmit {
                let dateFormatter=DateFormatter()
                dateFormatter.dateFormat = "hh:mm"


                let components = enteredtext.components(separatedBy: "_")
                
                //                tasks.tasks.append(Task(
                //                    title: components[0],
                //                    date: components.count>1 ? dateFormatter.date(from: components[1]) ?? tasks.activeDay: tasks.activeDay,
                //                    isCompleted: false))
                
                var newDate=tasks.activeDay

                if components.count>1{
                    //newDate =  (dateFormatter.date(from: components[1]) ?? tasks.activeDay)
                    let timeComponents = components[1].components(separatedBy: ":")
                    newDate = newDate.addingTimeInterval((Double(timeComponents[0]) ?? 0)*3600+(Double(timeComponents[1]) ?? 0)*60)
                }

           
                 
                
                tasks.newTask(
                    title: components[0],
                    date: newDate
                )
//                tasks.activeDay=dateFormatter.date(from: components[1]) ?? tasks.activeDay
                enteredtext=""
            }
            .foregroundColor(Color.black)
        
        
        
    }
}

struct TaskField_Previews: PreviewProvider {
    static var previews: some View {
        TaskField()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
