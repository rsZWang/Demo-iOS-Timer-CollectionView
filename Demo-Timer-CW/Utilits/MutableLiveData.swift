//
//  MutableLiveData.swift
//  OQR Ticket
//
//  Created by yhw on 2021/2/1.
//

import Foundation

class MutableLiveData<T>: NSObject {
    
    private var initValue: T?
    private var data: T?
    private var onChanged: ((T?) -> Void)?
    private var observers = [((T?) -> Void)?]()
    var value: T? {
        get {
            return data ?? initValue
        }
        set {
            data = newValue
            for observer in observers {
                observer?(data)
            }
        }
    }
    
    init(initValue: T? = nil) {
        self.initValue = initValue
    }
    
    func observe(onChanged: @escaping (T?) -> Void) {
        observers.append(onChanged)
        if data != nil {
            onChanged(data!)
        }
    }
    
}
