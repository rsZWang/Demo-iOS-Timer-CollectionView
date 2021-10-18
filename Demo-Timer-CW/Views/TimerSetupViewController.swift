//
//  TimerSetupViewController.swift
//  Demo-Timer-CW
//
//  Created by yhw on 2021/10/18.
//

import UIKit

class TimerSetupViewController: UIViewController {
    
    weak var viewModel: ViewModel!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancel)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(save)
        )
        datePicker.minimumDate = Date()
    }
    
    @objc
    private func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func save() {
        var name = textField.text
        if name == nil || name!.isEmpty {
            name = "No name"
        }
        viewModel.addTimer(name: name!, date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }

}
