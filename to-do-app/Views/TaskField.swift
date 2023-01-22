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
                dateFormatter.dateFormat = "HH:mm_dd/MM/yy"
                let components = enteredtext.components(separatedBy: "_")
                var newDate=tasks.activeDay
                if components.count==2{

                    let timeComponents = components[1].components(separatedBy: ":")
                    newDate = newDate.addingTimeInterval((Double(timeComponents[0]) ?? 0)*3600+(Double(timeComponents[1]) ?? 0)*60)
                }
                else if components.count==3{
                    let temp = components[1]+"_"+components[2]
                    newDate = dateFormatter.date(from: temp) ?? tasks.activeDay
                }
                tasks.newTask(
                    title: components[0],
                    date: newDate
                )
                enteredtext=""
                tasks.activeDay=newDate
            }
            .foregroundColor(Color.white)  
    }
}

struct TaskField_Previews: PreviewProvider {
    static var previews: some View {
        TaskField()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
