//
//  LocationsListView.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var model: LocationViewModel
    
    var body: some View {
        List{
            ForEach(model.locations) { location in
                Button(action: {
                    model.showLocationDetail(location: location)
                }, label: {
                    listView(location: location).padding(.vertical, 5)
                })
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView().environmentObject(LocationViewModel())
    }
}

extension LocationsListView{
    private func listView(location: LocationModel) -> some View {
        HStack {
            if let image = location.imageNames.first {
                Image(image).resizable().scaledToFill().frame(width: 50, height: 50).cornerRadius(10.0)
            }
            VStack (alignment: .leading){
                Text(location.name).font(.headline)
                Text(location.cityName).font(.subheadline)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
