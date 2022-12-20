//
//  DateView.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 20.12.2022.
//

import SwiftUI

struct DateView: View {
    let date:Date
    @State var isActive: Bool
    var body: some View {
        
        DataTab(isActive: isActive).onTapGesture {
            isActive.toggle()
        }
    
        .animation(.spring(response: 0.3, dampingFraction: 0.7))
       
        
       
    }
    @ViewBuilder
    func DataTab(isActive:Bool)->some View{
        ZStack{
            VStack(spacing: 15){
                Text(date.formatted(.dateTime.day())).foregroundColor(Color(.black))
                    .scaleEffect(isActive ? 1 : 0)
                
                    Text(date.formatted(.dateTime.weekday())).foregroundColor(Color(.black))
                        .font(.headline)
                        
                                            
                
    //            else {
    //                Text(date.formatted(.dateTime.weekday())).foregroundColor(Color(.black))
    //                    .font(.body)
    //
    //            }
                
                
                Image(systemName: "circle.circle.fill")
                    .foregroundColor(Color(.black))
                    .scaleEffect(isActive ? 1 : 0)
            }
            .frame(width:40, height: isActive ? 90 : 40)
            .padding()
            .background(Color( isActive ? .orange : .white)
                .transition(.slide)
            )
            .cornerRadius(isActive ? 40: 20)
            //.shadow(color: Color("darkGray"), radius: 15, x: isActive ? 0 : -15, y: isActive ? 0 : 45)
            .padding(.horizontal, 5)
            .scaleEffect(isActive ? 1.1 : 1)
            .offset(y: isActive ? 50 : 0)
        }
        //var isActive=isActive1
        
        
    }

}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date:Date(), isActive: true)
    }
}
