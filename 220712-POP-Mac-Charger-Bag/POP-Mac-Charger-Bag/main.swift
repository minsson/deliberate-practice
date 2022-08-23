//
//  main.swift
//  POP-Mac-Charger-Bag
//
//  Created by minsson on 2022/07/02.
//

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
    // 이 메서드는 충전기와 기기의 허용 와트시를 검사해서, 기기의 허용 와트시가 더 낮다면, 기기에 맞추어 와트시를 낮추어 반환하는 역할
}

typealias WattPerHour = Int
typealias Watt = Int
