//
//  ViewController.swift
//  CitiAppClip
//
//  Created by Jagadeesh Vinjam on 11/16/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var mobileTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.text = UserModel.shared.parasedCityName
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        UserModel.shared.title = titleTextField.text
        UserModel.shared.firstName = firstNameTextField.text
        UserModel.shared.lastName = lastNameTextField.text
        UserModel.shared.city = cityTextField.text
        UserModel.shared.mobile = mobileTextField.text
        return [titleTextField, firstNameTextField, lastNameTextField, cityTextField, mobileTextField].filter { !$0!.hasText }
            .count == 0
    }
    
}

extension ViewController {
    @IBAction func termsAndConditions() {
        let controller = SFSafariViewController(url: URL(string: "https://www.citi.com/credit-cards/compare-credit-cards/CMA-PIT")!)
        controller.modalPresentationStyle = .formSheet
        self.present(controller, animated: true, completion: nil)
    }
}

