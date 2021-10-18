//
//  TimerListViewController.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/16.
//

import UIKit

class TimerListViewController: UIViewController {
    
    private let viewModel = ViewModel()

    @IBOutlet weak var timerListCollectionView: TimerListCollectionView!
    @IBOutlet weak var timerListCollectionViewFrameLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @objc
    private func toAddTimer() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TimerSetupViewController") as! TimerSetupViewController
        viewController.viewModel = viewModel
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }

}

