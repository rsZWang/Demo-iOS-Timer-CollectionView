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
    var secs: Int
    
    mutating func minus() -> Int {
        secs -= 1
        return secs
    }
    
}
