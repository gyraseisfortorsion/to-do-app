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
            
            TasksView()
            TaskField()
            //.shadow(color: .black, radius: 5, x: 0, y: -10)
                //.frame(width: 350, height: 100, alignment: .center)
                .shadow(color: .white, radius: 0)
//                .cornerRadius(10)
                
                
            
            DatesView()
            //.flippedUpsideDown()
            //
        }
        .transition(.move(edge: .bottom))
        .animation(.default)
        .background(.black)
        .ignoresSafeArea()
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
