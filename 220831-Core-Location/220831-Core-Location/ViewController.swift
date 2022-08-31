//
//  ViewController.swift
//  220831-Core-Location
//
//  Created by minsson on 2022/08/31.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self // 델리게이트 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 우리가 원하는 위치 정확도
        locationManager.requestWhenInUseAuthorization() // 위치정보 요청
        // Privacy - Location When In Use Usage Description (메시지는 plist에서 설정해준 받아옴)
        // 허용하면 유저가 설정의 프라이버시에서 해당 앱의 location services를 허용하는 것과 같아짐

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            print("위치 가져오기 시작함")
        } else {
            print("위치 서비스 허용 off")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    // 위치를 가져오면 실행됨
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations) // 위도 경도, 풍속, 날짜, 시간 등 정보가 들어있는 Array
        
        if let location = locations.first {
            print("위치 업데이트!")
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
        }
    }
        
    // 위치 가져오는 과정에서 오류가 있었으면 실행됨
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}

