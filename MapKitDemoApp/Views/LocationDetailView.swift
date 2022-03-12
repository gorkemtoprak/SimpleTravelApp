//
//  LocationDetailView.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var model: LocationViewModel
    let location: LocationModel
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection.shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 10)
                VStack (alignment: .leading, spacing: 16){
                    VStack (alignment: .leading, spacing: 8){
                        Text(location.name).font(.largeTitle).fontWeight(.semibold)
                        Text(location.cityName).font(.title3).foregroundColor(.secondary)
                    }
                    Divider()
                    VStack (alignment: .leading, spacing: 8){
                        Text(location.description).font(.subheadline).foregroundColor(.secondary)
                        Divider()
                        if let url = URL(string: location.link){
                            Link("Read More on Wiki", destination: url).font(.headline)
                        }
                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: model.span)), annotationItems: [location]) { location in
                            MapAnnotation(coordinate: location.coordinates) {
                                LocationMapAnnotationView()
                                    
                            }
                        }.allowsHitTesting(false).aspectRatio(1, contentMode: .fit)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding()
            }
        }.ignoresSafeArea().overlay(backButton, alignment: .topLeading)
    }
    
    
    private var backButton: some View {
        Button{
            model.showSheet = nil
        } label: {
            Image(systemName: "xmark").font(.headline).padding(16).foregroundColor(.primary).cornerRadius(10).shadow(radius: 4).padding()
            
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!).environmentObject(LocationViewModel())
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView{
            ForEach(location.imageNames, id: \.self) { image in
                Image(image).resizable().scaledToFill().frame(width: UIScreen.main.bounds.width)
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

