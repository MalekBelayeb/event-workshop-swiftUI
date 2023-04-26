//
//  EventDetail.swift
//  event-workshop-swiftui
//
//  Created by ODC on 26/4/2023.
//

import Foundation

struct EventDetail : Identifiable
{
    var id :String
    let dateTime : String
    let date:String
    let image:String
    let title:String
    let place:String
    let address:String
    let performers : [Performer]
    
    
    
}
