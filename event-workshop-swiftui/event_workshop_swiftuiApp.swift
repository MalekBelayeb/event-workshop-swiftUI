//
//  event_workshop_swiftuiApp.swift
//  event-workshop-swiftui
//
//  Created by ODC on 25/4/2023.
//

import SwiftUI

@main
struct event_workshop_swiftuiApp: App {

    
    var body: some Scene {
        WindowGroup {
            
            HomeView().onAppear{
                
                Task
                {
                    let eventService = EventService()

                   let result = try await eventService.getAllEvents()
                    print(result)
                    
                }
                
            }
            
        }
    }
}
