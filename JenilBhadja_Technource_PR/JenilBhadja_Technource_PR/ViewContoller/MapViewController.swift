//
//  MapViewController.swift
//  JenilBhadja_Technource_PR
//
//  Created by JENIL BHADJA on 28/05/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var vwMapView : MKMapView!
    
    private var totalPinCount = 0
    private let maxPinsCount = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(onClickClearPins))
        navigationItem.rightBarButtonItem = clearButton
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickMap(_:)))
        vwMapView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onClickMap(_ sender: UITapGestureRecognizer) {
        if totalPinCount < maxPinsCount {
            let location = sender.location(in: vwMapView)
            let coordinate = vwMapView.convert(location, toCoordinateFrom: vwMapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            vwMapView.addAnnotation(annotation)
            totalPinCount += 1
        }
    }
    
    @objc func onClickClearPins() {
        let allAnnotations = vwMapView.annotations
        vwMapView.removeAnnotations(allAnnotations)
        totalPinCount = 0
    }
}
