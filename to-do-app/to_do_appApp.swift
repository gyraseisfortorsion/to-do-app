//
//  to_do_appApp.swift
//  to-do-app
//
//  Created by Askarali Talkybek on 17.12.2022.
//

import SwiftUI

@main
struct to_do_appApp: App {
    @StateObject var tasks = TasksViewModel(taskLimit: 3)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tasks)
        }
    }
}
