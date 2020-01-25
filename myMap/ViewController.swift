//
//  ViewController.swift
//  myMap
//
//  Created by Muhammed Essa on 1/19/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //41.004844, 28.976239
        let latitude : CLLocationDegrees = 41.004844
        let longitude : CLLocationDegrees = 28.976239
        let latDelta : CLLocationDegrees = 0.05
          let longitudeDelta : CLLocationDegrees = 0.05
        let span : MKCoordinateSpan = MKCoordinateSpan( latitudeDelta: latDelta, longitudeDelta: longitudeDelta )
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "Sultan Ahmet"
        annotation.subtitle = "Turkey - Istanbul"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
            let mylongpress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        mylongpress.minimumPressDuration = 2
        map.addGestureRecognizer(mylongpress)
    }
     
    @objc func longPress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: map)
         let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
         annotation.title = "new mark"
         annotation.subtitle = "Turkey"
         map.addAnnotation(annotation)
    }


}

