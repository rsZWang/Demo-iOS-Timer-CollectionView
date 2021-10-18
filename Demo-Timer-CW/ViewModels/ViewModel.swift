//
//  ViewModel.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/16.
//

import Foundation

class ViewModel: NSObject {
    
    let timerHandelrListMutableLiveData = MutableLiveData<[TimerHandler]>()
    
    func addTimer(name: String, date: Date) {
        var newList = timerHandelrListMutableLiveData.value ?? []
        newList.append(TimerHandler(id: 0, name: "", date: date))
        timerHandelrListMutableLiveData.value = newList
    }
    
    
}
