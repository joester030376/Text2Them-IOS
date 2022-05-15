//
//  CreateNewVC.swift
//  Text2Them
//
//  Created by mac on 21/04/21.
//

import UIKit

class CreateNewMessageVC: UIViewController, UITextFieldDelegate, UITextViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var subjectTextField: UITextField!
    var selectedCountry: String?
    var countryList = ["hi","hello","three","four","five"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI()
    {
        messageTextView.text = "Message"
        messageTextView.textColor =  .darkGray
        messageTextView.delegate = self
        createPickerView()
        dismissPickerView()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if messageTextView.text == "Message"
        {
            messageTextView.text = ""
            messageTextView.textColor = UIColor.black
            messageTextView.font = UIFont(name: "verdana", size: 18.0)
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if text == "\n" {
            messageTextView.resignFirstResponder()
        }
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView)
    {
        if messageTextView.text == ""
        {
            messageTextView.text = "Message"
            messageTextView.textColor = UIColor.lightGray
            messageTextView.font = UIFont(name: "verdana", size: 13.0)
        }
    }
    
    @IBAction func subjectButtonAction(_ sender: Any)
    {
        createPickerView()
    }
    
    func createPickerView()
    {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        subjectTextField.inputView = pickerView
    }
    
    func dismissPickerView()
    {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        subjectTextField.inputAccessoryView = toolBar
    }
    
    @objc func handleMobileDone(_ sender: UITextField)
    {
        print(#function)
      //  subjectTextField.text = selectedCountry
        self.subjectTextField.text = sender.text
        subjectTextField.textColor = .black
        sender.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @objc func action()
    {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return countryList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return countryList[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedCountry = countryList[row] // selected item
        subjectTextField.text = selectedCountry
    }
}
