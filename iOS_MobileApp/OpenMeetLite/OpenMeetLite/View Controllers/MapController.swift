//
//  MapController.swift
//  OpenMeetLite
//
//  Created by Yuri on 08/02/23.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var Done: UIButton!
    
    var coordinate = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.setHidesBackButton(true, animated: true)
        MapView.delegate = self
        MapView.layer.cornerRadius = 10.0
        
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        pressGesture.minimumPressDuration = 0.3
        MapView.addGestureRecognizer(pressGesture)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if(gestureRecognizer.state == .ended){
            let location = gestureRecognizer.location(in: MapView)
            coordinate = MapView.convert(location, toCoordinateFrom: MapView)
            print(coordinate)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            MapView.removeAnnotations(MapView.annotations)
            MapView.addAnnotation(annotation)
            Done.isEnabled = true
        }
    }
    
    func setCityFromCoordinates(coordinates: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocode failed with error: \(error)")
            }
            if let placemarks = placemarks, let placemark = placemarks.first
            {
                let city = placemark.locality ?? ""
                print(city)
                
                if let popoverController = self.popoverPresentationController {
                    _ = popoverController.presentingViewController
                    if(city.isEmpty){
                        location_city = "Invalid location"
                    }
                    else{
                        location_city = city
                    }
                    semaphore.signal()
                }
                
            }
            
        }
    }
    
    
    @IBAction func doneClick(_ sender: UIButton) {
       
        var m = doRetrieveMeeter()
        m.latitude = coordinate.latitude
        m.longitude = coordinate.longitude
        print(m)
        doStoreMeeter(meeter: m)
        
        setCityFromCoordinates(coordinates: coordinate)

        
        self.dismiss(animated: true)
    }
}
