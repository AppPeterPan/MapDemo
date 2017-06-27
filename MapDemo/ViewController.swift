//
//  ViewController.swift
//  MapDemo
//
//  Created by Peter Pan on 26/06/2017.
//  Copyright © 2017 Peter Pan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    let annotationIdentifier = "store"
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if #available(iOS 11.0, *) {
            mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: annotationIdentifier)
        }
        
        let store1 = Store(title: "誠品", subtitle: "敦南店", coordinate: CLLocationCoordinate2D(latitude: 25.0392, longitude: 121.5496), info: "不睡覺文青去的書局")
        let store2 = Store(title: "誠品", subtitle: "信義店", coordinate: CLLocationCoordinate2D(latitude: 25.0396, longitude: 121.5658), info: "愛睡覺文青去的書局")
        mapView.addAnnotations([store1, store2])
        
        
        mapView.region = MKCoordinateRegion(center: store1.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Store {
            // iOS 11
            var annotationView:MKAnnotationView?
            if #available(iOS 11.0, *) {
                annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier, for: annotation)
                
                let marker = annotationView as! MKMarkerAnnotationView
                marker.markerTintColor = UIColor.orange
                //marker.glyphText = "📓"
                marker.glyphImage = UIImage(named: "eslite")
                
            }
            else {
                annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
                if annotationView == nil {
                    annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                }
                else {
                    annotationView?.annotation = annotation
                }
            }
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
            
        }
        else {
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let store = view.annotation as! Store
        let controller = UIAlertController(title: store.title, message: store.info, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}

 
