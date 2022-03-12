import SwiftUI

@main
struct MapKitDemoApp: App {
    @StateObject private var model = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(model)
        }
    }
}
