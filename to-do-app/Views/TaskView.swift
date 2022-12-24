//
//  TaskView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 21.12.2022.
//

import SwiftUI

struct TaskView: View {
    @State var task:Task
    var body: some View {
        taskTab(isCompleted:task.isCompleted)
            .onTapGesture (count: 2){
                task.isCompleted.toggle()
            }
            .transition(.move(edge: .bottom))
            .animation(.spring())
            //.background(Color.black)
            
    }
    @ViewBuilder
    func taskTab(isCompleted: Bool)->some View{
        ZStack{
            HStack{
                VStack{Divider().frame(maxHeight:0.5).background(Color.white).padding()}
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color(.orange))
                    .scaleEffect(isCompleted ? 2: 0)
                VStack{Divider().frame(maxHeight:0.5).background(Color.white).padding()}
            }
           
    
            HStack{
           
                    Image(systemName: "circle.circle.fill")
                    
                        .padding(.horizontal, 30)
                        .scaleEffect(1.5)
                  
                        Text(task.title).font(.system(size: 25))
                        
                    
                    Spacer()
                Text(task.date, style: .time).padding().font(.title2)
            }
            .frame(width: UIScreen.main.bounds.width/1.1, height: 100, alignment: .leading)
            .background(Color(.white))
            .cornerRadius(30)
            .shadow(color: Color.gray, radius: 10)
            .scaleEffect(!isCompleted ? 1 : 0) 
        
        }
        //.background(Color.black)
            
            
    }
    
        
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskView(task: Task(secondId:1, title: "Laundry", date: Date(), isCompleted: false))
          
        }
            
    }
}
