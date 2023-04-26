//
//  EventViewModel.swift
//  event-workshop-swiftui
//
//  Created by ODC on 26/4/2023.
//

import Foundation


class EventViewModel:ObservableObject
{
    @Published var eventDetail : EventDetail?
    @Published var upcomingEventIsLoading : Bool = false
    @Published var upcomingEvents:[Event] = []
    @Published var eventDetailIsLoading : Bool = false
    let eventService = EventService()

    
    func getAllEvents()
    {
        
        Task
        {
            DispatchQueue.main.async {
                self.upcomingEventIsLoading = true

            }

            
            let result = try await eventService.getAllEvents()
            
            if let results = (result as? EventResponse ){
                DispatchQueue.main.async {
                                    self.upcomingEvents = results.events.map{
                        
                        event in
                        
                                        return Event (id: "\(event.id ?? 0)",date: event.datetime_utc ?? "", image: "", title: event.title ?? "", location: event.venue.address ?? "" , performers: [])
                    }

                }
            
            }
            else{
                
            }
            DispatchQueue.main.async {
                self.upcomingEventIsLoading = false

            }        }

        
        
        
    }
    
    func getEventById(id : String){
        Task
        {
            DispatchQueue.main.async {
                self.eventDetailIsLoading = true

            }

            
            let result = try await eventService.getEventById(url: Consts.getEventByIdUrl(id: id) )
            
            if let eventDetailResult = (result as? EventBodyResponse ){
                DispatchQueue.main.async {
                    self.eventDetail = EventDetail(id: String(eventDetailResult.id ?? 0), dateTime: eventDetailResult.datetime_utc ?? "", date: eventDetailResult.datetime_utc ?? "", image: "Image", title: eventDetailResult.title ?? "", place: eventDetailResult.venue.display_location ?? "", address: eventDetailResult.venue.address ?? "", performers: [])

                }
            
            }
            else{
                
            }
            DispatchQueue.main.async {
                self.eventDetailIsLoading = false

            }        }

    }
    
    
    
}
