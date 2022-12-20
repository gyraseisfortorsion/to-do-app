//
//  DatesView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import SwiftUI

struct DatesView: View {
    @EnvironmentObject var tasks: TasksViewModel
    var body: some View {
  
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(tasks.dates, id: \.self) {date in
                    DateView(date: date, isActive: false)
                        .padding(.top, 20)
                }
            }
            .padding(.bottom, 100)
   
        

            
        }
    }
}

struct DatesView_Previews: PreviewProvider {
    static var previews: some View {
        DatesView()
            .environmentObject(TasksViewModel(taskLimit: 3))
    }
}
