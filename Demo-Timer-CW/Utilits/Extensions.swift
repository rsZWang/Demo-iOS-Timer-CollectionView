//
//  Extensions.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/17.
//

import Foundation

extension Int {
    
    var numberToChi: String {
        get {
            switch self {
            case 1:
                return "ㄧ"
            case 2:
                return "二"
            case 3:
                return "三"
            case 4:
                return "四"
            case 5:
                return "五"
            case 6:
                return "六"
            case 7:
                return "七"
            case 8:
                return "八"
            case 9:
                return "九"
            default:
                return "錯誤，非1~9的數字"
            }
        }
    }
    
}
