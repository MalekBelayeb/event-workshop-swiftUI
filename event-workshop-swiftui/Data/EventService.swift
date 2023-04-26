//
//  EventService.swift
//  event-workshop-swiftui
//
//  Created by ODC on 25/4/2023.
//

import Foundation



class EventService
{
    
    
    
    func getAllEvents(url:String = Consts.getAllEvents,method:String = "GET") async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method

        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = ( response as? HTTPURLResponse )
        {
            
            if response.statusCode == 200
            {
                
                
                return try JSONDecoder().decode(EventResponse.self, from: data)
                
            }else{
                
                return nil
            }
            
        }else{
            return nil
        }
        
    }
    
    func getEventById(url:String,method:String = "GET") async throws -> Any?

    {
        guard let url = URL(string: url) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method

        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = ( response as? HTTPURLResponse )
        {
            
            if response.statusCode == 200
            {
                
                
                return try JSONDecoder().decode(EventBodyResponse.self, from: data)
                
            }else{
                
                return nil
            }
            
        }else{
            return nil
        }
    }
    
}
