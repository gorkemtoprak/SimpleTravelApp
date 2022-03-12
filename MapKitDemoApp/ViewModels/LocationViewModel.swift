//
//  LocationViewModel.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    @Published var locations: [LocationModel]
    
    @Published var mapLocation: LocationModel{
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    @Published var showSheet: LocationModel? = nil
    
    init() {
        let loc = LocationsDataService.locations
        self.locations = loc
        self.mapLocation = loc.first!
        self.updateMapRegion(location: loc.first!)
    }
    
    private func updateMapRegion(location: LocationModel){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center:  location.coordinates, span: span)
        }
    }
    
    func toggleLocationList (){
        withAnimation(.easeInOut){
//            showLocationList = !showLocationList
            showLocationList.toggle()
        }
    }
    
    func showLocationDetail(location: LocationModel){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextLocation (){
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            return 
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLoc = locations.first else {
                return
            }
            showLocationDetail(location: firstLoc)
            return
        }
        let nextLoc = locations[nextIndex]
        showLocationDetail(location: nextLoc)
    }
}
