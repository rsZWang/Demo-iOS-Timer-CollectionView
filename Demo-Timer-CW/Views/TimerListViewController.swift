//
//  TimerListViewController.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/16.
//

import UIKit

class TimerListViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private var timer: Timer?

    @IBOutlet weak var timerListCollectionView: TimerListCollectionView!
    @IBOutlet weak var timerListCollectionViewFrameLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(onResume),
//            name: UIApplication.didBecomeActiveNotification,
//            object: nil
//        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onPause),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(toAddTimer)
        )
        
        viewModel.timerHandelrListMutableLiveData.observe { [weak self] list in
            if let list = list, !list.isEmpty {
                self?.timerListCollectionView.setData(list)
            }
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.timerListCollectionView.reloadData()
        }
        timer.fire()
        RunLoop.main.add(timer, forMode: .common)
    }
    
    // Simulate like android
    @objc
    private func onPause() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    private func toAddTimer() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TimerSetupViewController") as! TimerSetupViewController
        viewController.viewModel = viewModel
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }

}

