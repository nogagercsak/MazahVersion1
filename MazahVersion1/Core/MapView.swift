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


struct MapView: UIViewRepresentable {
    @StateObject private var viewModel = MapViewModel()
    @Binding var foodDrives: [FoodDrive]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(viewModel.region, animated: true) // Set initial region
        
        // Check for location services
        viewModel.checkIfLocationServicesIsEnabled()
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        
        for foodDrive in foodDrives {
            let annotation = MKPointAnnotation()
            annotation.title = foodDrive.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: foodDrive.location.latitude, longitude: foodDrive.location.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is MKPointAnnotation else { return nil }
            
            let identifier = "foodDriveAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
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
