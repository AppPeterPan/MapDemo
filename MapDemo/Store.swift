//
//  Store.swift
//  MapDemo
//
//  Created by Peter Pan on 27/06/2017.
//  Copyright © 2017 Peter Pan. All rights reserved.
//

import UIKit
import MapKit

class Store: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var info: String
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.info = info
    }
}
