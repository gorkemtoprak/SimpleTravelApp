//
//  LocationModel.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import Foundation
import MapKit

struct LocationModel: Identifiable, Equatable{
    
//    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
//    Identifiable
    var id: String{
        name + cityName
    }
    
    //lhs ==> Left Hand Side --- rhs ==> Right Hand Side
    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        lhs.id == rhs.id
    }
}
