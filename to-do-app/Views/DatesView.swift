//
//  DatesView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import SwiftUI

struct DatesView: View {
    @EnvironmentObject var tasks: TasksViewModel
    @State var isActive1: Bool = false
    var body: some View {
  
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(tasks.dates, id: \.self) {date in
                    DateView(date: date, isToday: Calendar.current.isDate(tasks.today, inSameDayAs: date))
                        .padding(.top, 20)
                        .onTapGesture {
                            tasks.activeDay=date
                            isActive1=true
                        }
                }
                
            }
            .padding(.bottom, isActive1 ? 0 : 40 )
            .padding(.top, 40)
            .ignoresSafeArea()
        }
        .animation(.default)
    }
}

struct DatesView_Previews: PreviewProvider {
    static var previews: some View {
        DatesView()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
