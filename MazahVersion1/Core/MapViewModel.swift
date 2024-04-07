//
//  MapViewModel.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import Foundation
import CoreLocation
import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager =  CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Location is not enabled. Please turn it on")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted. Likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
            
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
