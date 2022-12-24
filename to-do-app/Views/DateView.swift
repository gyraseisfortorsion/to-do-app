//
//  DateView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import SwiftUI

struct DateView: View {
    let date:Date
    let isToday: Bool
    @EnvironmentObject var tasks: TasksViewModel
    //@State var isActive: Bool
    var body: some View {
        
        DataTab().onTapGesture {
            tasks.activeDay=date
        }
    
        .animation(.spring(response: 0.3, dampingFraction: 0.7))
       
        
       
    }
    @ViewBuilder
    func DataTab()->some View{
        ZStack{
            VStack(spacing: 15){
                Text(date.formatted(.dateTime.day())).foregroundColor(Color(.black))
                    .scaleEffect(date==tasks.activeDay ? 1 : 0)
                
                    Text(date.formatted(.dateTime.weekday())).foregroundColor(Color(.black))
                        .font(.headline)
                        
                                            
                
    //            else {
    //                Text(date.formatted(.dateTime.weekday())).foregroundColor(Color(.black))
    //                    .font(.body)
    //
    //            }
                
                
                Image(systemName: "circle.circle.fill")
                    .foregroundColor(Color(.black))
                    .scaleEffect(date==tasks.activeDay ? 1 : 0)
            }
            .frame(width:40, height: date==tasks.activeDay ? 90 : 40)
            .padding()
            .background(Color( date==tasks.activeDay ? .orange : .white)
                .transition(.slide)
            )
            .cornerRadius(date==tasks.activeDay ? 40: 20)
            .shadow(color: Color(date==tasks.activeDay ? .white : .orange), radius: 0, y: date==tasks.activeDay ? 0 :(!isToday ? 0 : -20))
            .padding(.horizontal, 5)
            .scaleEffect(date==tasks.activeDay ? 1.1 : 1)
            //.offset(x: isToday ? 10 : 0, y: isToday ?  -20: 0)
            .shadow(radius: date==tasks.activeDay ? 0:10)
       
        }
        //var isActive=isActive1
        
        
    }

}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date:Date(), isToday: true)
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
