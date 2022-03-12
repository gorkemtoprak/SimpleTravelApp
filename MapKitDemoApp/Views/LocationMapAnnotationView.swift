//
//  LocationMapAnnotationView.swift
//  MapKitDemoApp
//
//  Created by GT on 12.03.2022.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "mappin.circle").resizable().scaledToFit().frame(width: 30, height: 30).font(.headline).foregroundColor(.white).padding(6).background(accentColor).cornerRadius(36).padding(.bottom, 20)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
