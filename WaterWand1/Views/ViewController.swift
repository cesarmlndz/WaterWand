//
//  ViewController.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/20/23.
//

import UIKit
import MapboxMaps
 
class ViewController: UIViewController {
 
    internal var mapView: MapView!
     
    override public func viewDidLoad() {
        super.viewDidLoad()
         
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoicmRmbGFiIiwiYSI6ImNreDdxb215eTJlZDQyb3BuaThlbXlxd20ifQ.9zxCK-Q6kNuyWptnuTjgWQ")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         
        self.view.addSubview(mapView)
    }
}
