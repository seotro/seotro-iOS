//
//  CourseArrangeVC.swift
//  Seotro
//
//  Created by suna ji on 2020/05/05.
//  Copyright © 2020 박지수. All rights reserved.
//
import UIKit

class CourseArrangeVC: UIViewController, MTMapViewDelegate {
    var mapView: MTMapView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView{
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
    }
    

   

}
