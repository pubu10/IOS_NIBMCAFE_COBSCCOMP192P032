//
//  LocationAccssViewController.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-08.
//

import UIKit
import  CoreLocation

class LocationAccssViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print(location.coordinate)
        }
        
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if(status == CLAuthorizationStatus.denied)
//        {
//
//
//        }
//    }
//    func showLocationDisablePoopup()
//    {
//
//        let alertControler = UIAlertController(title: "Background Location Access denid",
//                                               message: "heloo",
//                                               preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "", style: .cancel, handler: nil)
//
//        let openAction = UIAlertAction(title: "Open Settings", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
    
//    }
    
    @IBAction func btnAllowLocation(_ sender: Any) {
        
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "tbViewController" )
                    vc.modalPresentationStyle = .overFullScreen
                    present(vc, animated: true)
            
        }
    }

}
