//
//  MapView.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import SwiftUI
import MapKit

struct GeoPoint {
    var latitude: Double
    var longitude: Double
}

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @Binding var foodDrives: [FoodDrive]

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: foodDrives) { foodDrive in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: foodDrive.location.latitude, longitude: foodDrive.location.longitude)) {
                    FoodDriveMapAnnotation(foodDrive: foodDrive)
                }
            }
            .ignoresSafeArea(edges: .all)
        }
        .onAppear {
            // Check for location services
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

struct FoodDriveMapAnnotation: View {
    var foodDrive: FoodDrive

    var body: some View {
        VStack {
            Image(systemName: "mappin")
                .foregroundColor(.green)
            Text(foodDrive.name)
                .foregroundColor(.primary)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    @State static var foodDrives: [FoodDrive] = [
        FoodDrive(name: "Food Drive 1", description: "Description 1", location: GeoPoint(latitude: 37.123, longitude: -122.456), address: "123 Main St, City, State, Zip", contact: "Contact 1"),
        FoodDrive(name: "Food Drive 2", description: "Description 2", location: GeoPoint(latitude: 37.456, longitude: -122.789), address: "456 Elm St, City, State, Zip", contact: "Contact 2")
    ]

    static var previews: some View {
        MapView(foodDrives: $foodDrives)
    }
}
