//
//  MapViewController.swift
//  FoodPin
//
//  Created by rd on 2019/3/15.
//  Copyright © 2019 AppCoda. All rights reserved.
//
import MapKit

import UIKit


class MapViewController: UIViewController, MKMapViewDelegate {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet var mapView: MKMapView!
    var restoration = Restaurant()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        let geoColer = CLGeocoder()
        geoColer.geocodeAddressString(restoration.location, completionHandler: { placemarks, error in if let error = error{
            print(error)
            return
            }
            if let placemarks = placemarks {
                let placemarks = placemarks[0]
                let annotation = MKPointAnnotation()
                annotation.title = self.restoration.name
                annotation.subtitle = self.restoration.type
                
                if let location = placemarks.location {
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"

        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }

        //
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)

        }
        annotationView?.glyphText = "😀"
        annotationView?.markerTintColor = UIColor.orange

        return annotationView
    }
    

}
