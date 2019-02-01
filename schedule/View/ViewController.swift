//
//  ViewController.swift
//  schedule
//
//  Created by Влад Лиховид on 1/13/19.
//  Copyright © 2019 Влад Лиховид. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDatePick: UITextField!
    @IBOutlet weak var lastDatePick: UITextField!
    @IBOutlet weak var group: UITextField!
    @IBOutlet weak var teather: UITextField!
    @IBOutlet weak var classroom: UITextField!
    
    let firstDatePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.minimumDate = picker.date
        return picker
    }()
    let lastDatePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.minimumDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
        return picker
    }()
    let groupPickerView = UIPickerView()
    let teatherPickerView = UIPickerView()
    let classroomPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstDatePick.text = dateFormatToString(picker: firstDatePickerView)
        firstDatePick.inputView = firstDatePickerView
        firstDatePickerView.addTarget(self, action: #selector(datePick(pick:)), for: .valueChanged)
        
        lastDatePick.text = dateFormatToString(picker: lastDatePickerView)
        lastDatePick.inputView = lastDatePickerView
        lastDatePickerView.addTarget(self, action: #selector(datePick(pick:)), for: .valueChanged)
        
        group.inputView = groupPickerView
        groupPickerView.delegate = self
        
        teather.inputView = teatherPickerView
        teatherPickerView.delegate = self
        
        classroom.inputView = classroomPickerView
        classroomPickerView.delegate = self
    }
    @objc func datePick(pick: UIDatePicker) {
        if pick.isEqual(self.firstDatePickerView) {
            firstDatePick.text = dateFormatToString(picker: firstDatePickerView)
        } else if pick.isEqual(self.lastDatePickerView) {
            lastDatePick.text = dateFormatToString(picker: lastDatePickerView)
        }
    }
    
    func dateFormatToString(picker: UIDatePicker) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let string = dateFormatter.string(from: picker.date)
        return string
    }
    @IBAction func requestActionButton(_ sender: Any) {
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.inputView?.isHidden
//    }
//}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case groupPickerView:
            return groups.count
        case teatherPickerView:
            return teachers.count
        case classroomPickerView:
            return classrooms.count
        default:
            break
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case groupPickerView:
            return groups[row]
        case teatherPickerView:
            return teachers[row]
        case classroomPickerView:
            return classrooms[row]
        default:
            break
        }
        return nil
        
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case groupPickerView:
            group.text = groups[row]
        case teatherPickerView:
            teather.text = teachers[row]
        case classroomPickerView:
            classroom.text = classrooms[row]
        default:
            break
        }
    }
}

