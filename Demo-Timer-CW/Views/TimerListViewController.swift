//
//  TimerListViewController.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/16.
//

import UIKit

class TimerListViewController: UIViewController {

    @IBOutlet weak var timerListCollectionView: TimerListCollectionView!
    @IBOutlet weak var timerListCollectionViewFrameLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(toAddTimer)
        )  
    }
    
    @objc
    private func toAddTimer() {
//        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }

}

