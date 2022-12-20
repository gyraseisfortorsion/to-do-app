//
//  ContentView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var TaskViewModel: TasksViewModel
    var body: some View {

        VStack(spacing:20){
                DatesView()
                TaskField()
                Spacer()
                ForEach(TaskViewModel.tasks){task in
                    TaskView(task:task)
                        
                }
                .onDelete(perform: TaskViewModel.deleteTask)
            
                
            }
        .background(Color.black)
       
       
       
            
      
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
