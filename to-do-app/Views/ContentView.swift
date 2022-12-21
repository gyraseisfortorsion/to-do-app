//
//  ContentView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 17.12.2022.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    @EnvironmentObject var TaskViewModel: TasksViewModel
    var body: some View {
        
        VStack(spacing:20){
            DatesView()
            List{
                TaskField()
                Spacer()
                ForEach(TaskViewModel.tasks){task in
                    TaskView(task:task)
                        .padding(.vertical, 10)
                    //.flippedUpsideDown()
                }
                
                .onDelete(perform: TaskViewModel.deleteTask)
                //.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

            }
            .listStyle(.sidebar)
            .padding(.horizontal, -20)
            
            //.flippedUpsideDown()
            //
           
            
        }
        .animation(.default)
        .background(.white)
    }
}

struct FlippedUpsideDown: ViewModifier {
   func body(content: Content) -> some View {
    content
           .rotationEffect(.radians(.pi))
           .scaleEffect(x: -1, y: 1, anchor: .center)
   }
}
extension View{
   func flippedUpsideDown() -> some View{
     self.modifier(FlippedUpsideDown())
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TasksViewModel(taskLimit: 3))
            .previewInterfaceOrientation(.portrait)
    }
}
