//
//  MapViewController.swift
//  MazahVersion1
//
//  Created by Noga Gercsak on 4/6/24.
//

import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var foodDrives: [FoodDrive] = [] {
        didSet {
            // When food drives are set, update the map
            updateMapAnnotations()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Request location permission
        LocationManager.shared.requestLocation()
        
        // Set the map view delegate
        mapView.delegate = self
    }
    
    func updateMapAnnotations() {
        mapView.removeAnnotations(mapView.annotations) // Clear existing annotations
        
        for foodDrive in foodDrives {
            let annotation = MKPointAnnotation()
            annotation.title = foodDrive.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: foodDrive.location.latitude, longitude: foodDrive.location.longitude)
            mapView.addAnnotation(annotation)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "foodDriveAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotationTitle = view.annotation?.title {
            // Handle tap on annotation
            print("Tapped on \(annotationTitle!)")
        }
    }
}
