//
//  ViewController.swift
//  HyperTrackSample
//
//  Created by Sam Paul on 19/09/17.
//  Copyright © 2017 Turvo. All rights reserved.
//

import UIKit
import HyperTrack
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var trackAction: UIButton!
    @IBOutlet var mapView: MKMapView!
    
    var trackingStatus: TrackingStatus = .notTracking
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HyperTrack.requestAlwaysAuthorization()
        HyperTrack.requestMotionAuthorization()
        updateButtonTitle()
        initMapView()
    }
    
    func initMapView() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        mapView.mapType = .standard
    }
    
    private func updateButtonTitle() {
        trackAction.setTitle(trackingStatus.description, for: .normal)
        trackAction.backgroundColor = trackingStatus.backgroundColor
        trackAction.setTitleColor(trackingStatus.textColor, for: .normal)
    }
    
    @IBAction func trackActionClicked(_ sender: Any) {
        switch trackingStatus {
        case .notTracking:
            HyperTrack.startTracking()
        case .tracking:
            HyperTrack.stopTracking()
        }
        trackingStatus.toggle()
        updateButtonTitle()
    }
}
