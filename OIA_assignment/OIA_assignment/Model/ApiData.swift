//
//  Data.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import Foundation

struct ApiData:Codable{
    var total_clicks : Int
    var data : data
}

struct data:Codable{
    var recent_links : [links]
    var top_links : [links]
}

struct links : Codable,Identifiable{
    var url_id: Int
    var original_image : String
    var created_at : String
    var web_link : String
    var total_clicks : Int
    var title : String
    var id: Int {
        url_id
    }
}
