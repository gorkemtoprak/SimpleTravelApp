//
//  LocationPreviewView.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var model: LocationViewModel
    let location: LocationModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                image
                title
            }
            VStack(spacing: 16.0) {
                Button {
                    model.showSheet = location
                } label: {
                    Text("Learn More").font(.headline)
                }
                Button {
                    model.nextLocation()
                } label: {
                    Text("Next").font(.headline)
                }
            }
        }.padding(20).background(Color.white).cornerRadius(30)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
        }.environmentObject(LocationViewModel())
    }
}

extension LocationPreviewView {
    private var image: some View {
        ZStack {
            if let image = location.imageNames.first {
                Image(image).resizable().scaledToFill().frame(width: 100, height: 100).cornerRadius(10.0)
            }
        }.cornerRadius(10.0)
    }
    
    private var title: some View {
        VStack(alignment: .leading) {
            Text(location.name).font(.title2).fontWeight(.bold).foregroundColor(.accentColor)
            Text(location.cityName).font(.subheadline).foregroundColor(.accentColor)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
