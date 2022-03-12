//
//  LocationsView.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var model: LocationViewModel
        
    var body: some View {
        ZStack{
            Map(coordinateRegion: $model.mapRegion, annotationItems: model.locations, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(model.mapLocation == location ? 1 : 0.8).onTapGesture {
                            model.showLocationDetail(location: location)
                        }
                }
            }).ignoresSafeArea()
            
            VStack (spacing: 0){
                header.padding()
                Spacer()
                
                ZStack{
                    ForEach(model.locations) { location in
                        if model.mapLocation == location {
                            LocationPreviewView(location: location).padding().shadow( color: Color.black.opacity(0.3), radius: 20).transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
                
            }
        }.sheet(item: $model.showSheet, onDismiss: nil) { loc in
            LocationDetailView(location: loc)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocationViewModel())
    }
}

extension LocationsView{
    private var header: some View{
        VStack {
            Button(action: model.toggleLocationList) {
                Text(model.mapLocation.name + ", " + model.mapLocation.cityName).font(.title2).fontWeight(.black).foregroundColor(.accentColor).frame(height: 55).frame(maxWidth: .infinity)
                Image(systemName: "arrow.down").font(.headline).foregroundColor(.accentColor).padding().rotationEffect(Angle(degrees: model.showLocationList    ? 180 : 0))
            }
            if (model.showLocationList){
                LocationsListView()
            }
        }.background(Color.white).cornerRadius(10.0).shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 15)
    }
}
