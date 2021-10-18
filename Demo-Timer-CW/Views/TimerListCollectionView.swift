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
        let dayString = timeDigitToString(countdown.day!, length: 3)
        let hourString = timeDigitToString(countdown.hour!, length: 2)
        let minuteString = timeDigitToString(countdown.minute!, length: 2)
        timeLabel.attributedText = toTimeLabelAttributedString(
            date: dayString,
            hour: hourString,
            minute: minuteString
        )
    }
    
    private func timeDigitToString(_ digit: Int, length: Int) -> String {
        if digit < 0 {
            return "0".padLeft(length: length, padding: "0")
        } else {
            return String(digit).padLeft(length: length, padding: "0")
        }
    }
    
    private func toTimeLabelAttributedString(
        date: String,
        hour: String,
        minute: String
    ) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(NSMutableAttributedString(
            string: date,
            attributes: [ NSAttributedString.Key.backgroundColor : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) ]
        ))
        mutableAttributedString.append(NSMutableAttributedString(
            string: "  ：",
            attributes: [ NSAttributedString.Key.backgroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
        ))
        mutableAttributedString.append(NSMutableAttributedString(
            string: hour,
            attributes: [ NSAttributedString.Key.backgroundColor : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) ]
        ))
        mutableAttributedString.append(NSMutableAttributedString(
            string: "  ：",
            attributes: [ NSAttributedString.Key.backgroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
        ))
        mutableAttributedString.append(NSMutableAttributedString(
            string: minute,
            attributes: [ NSAttributedString.Key.backgroundColor : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) ]
        ))
        return mutableAttributedString
    }
    
}

extension String {
    func padLeft(length: Int, padding: String) -> String {
        let toPad = length - self.count
        if toPad < 1 {
            return self
        }
        return "".padding(toLength: toPad, withPad: padding, startingAt: 0) + self
    }
}

