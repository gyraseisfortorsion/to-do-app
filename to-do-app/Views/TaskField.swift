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
                dateFormatter.dateFormat = "HH:m"
                let components = enteredtext.components(separatedBy: "_")
                
                tasks.tasks.append(Task(
                    title: components[0],
                    description:"",
                    date: components.count>1 ? dateFormatter.date(from: components[1]) ?? Date(): Date(),
                    isCompleted: false))
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
