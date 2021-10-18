//
//  TimerHandler.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/16.
//

import Foundation

struct TimerHandler {
    
    var id: Int
    var name: String
    var date: Date
    
    func count() -> DateComponents {
        Calendar.current.dateComponents([.day, .hour, .minute], from: Date(), to: date)
    }
    
}
