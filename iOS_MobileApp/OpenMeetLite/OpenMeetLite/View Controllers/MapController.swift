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
            let coordinate = MapView.convert(location, toCoordinateFrom: MapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            MapView.removeAnnotations(MapView.annotations)
            MapView.addAnnotation(annotation)
            Done.isEnabled = true
        }
    }
    
    @IBAction func doneClick(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}
