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
                    .shadow(color: .white, radius: 0)
                    .shadow(color: .white, radius: 0)
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                    .padding(.vertical)
                    //.cornerRadius(50)
                    //.cornerRadius(10)
                    //.border(.orange)
                .background(Color.black
                    .ignoresSafeArea()
                    //.padding(-10)
                    .cornerRadius(50)
                    .shadow(color: .black, radius:0, x: 0, y: -17)
                    .shadow(color: .white, radius:0, x: 0, y: -5)

                )
                
                DatesView()
                
            
            
                //.shadow(color: .white, radius: 1, x: 0, y: -10 )
            //.frame(width: UIScreen.main.bounds.width, height: 300)
            //.cornerRadius(10)
            //.shadow(color: .white, radius: 1, x: 0, y: -10 )
            //.border(.white)
//            .overlay(
//                RoundedRectangle(cornerRadius: 50)
//                    .stroke(Color.black, lineWidth: 0)
//                    .shadow(color: .white, radius: 1, x: 0, y: -10 )
//            )
            }
            //
            .transition(.move(edge: .bottom))
            .animation(.default)
            .background(.black)
            .ignoresSafeArea()
        
        
    }
}

@ViewBuilder
func ControlPanel()->some View{

    
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .shadow(color: .white, radius: 1, x: 0, y: -10 )
        VStack{
        TaskField()
            .shadow(color: .white, radius: 0)
            .shadow(color: .white, radius: 0)
            //.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
            //.cornerRadius(10)
            //.border(.orange)
            DatesView()
            
        }
            
        
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
