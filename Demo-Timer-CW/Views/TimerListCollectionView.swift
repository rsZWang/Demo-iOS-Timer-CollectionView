//
//  TimerListCollectionView.swift
//  Demo-Timer-CW
//
//  Created by YINGHAO WANG on 2021/10/17.
//

import UIKit

class TimerListCollectionView: UICollectionView {

    var timerHandlerList = [TimerHandler]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
        dataSource = self
    }
    
    func setData(_ list: [TimerHandler]) {
        timerHandlerList.removeAll()
        timerHandlerList.append(contentsOf: list)
        reloadData()
    }

}

extension TimerListCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        timerHandlerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimerListCollectionViewCell", for: indexPath) as! TimerListCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        let index = indexPath.row
        cell.bind(index: index, timerHandler: timerHandlerList[index])
        return cell
    }
    
}

extension TimerListCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        Log.i("sizeForItemAt: \(indexPath)")
        return CGSize(width: collectionView.frame.width/2 - 9, height: 200)
    }
      
      // 3
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
    }

    // 4
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        5
    }
    
}

class TimerListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemIndexLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func bind(index: Int, timerHandler: TimerHandler) {
        itemIndexLabel.text = timerHandler.name
        let countdown = timerHandler.count()
        timeLabel.text = "\(countdown.day!)：\(countdown.hour!)：\(countdown.minute!)"
    }
    
}

