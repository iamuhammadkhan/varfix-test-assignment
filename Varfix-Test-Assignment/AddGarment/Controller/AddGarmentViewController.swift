//
//  AddGarmentViewController.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/6/21.
//

import UIKit

protocol AddNewgarmentProtocol: NSObject {
    func newGarmentAdded(garment: Garment)
}

final class AddGarmentViewController: UIViewController {
    
    weak var delegate: AddNewgarmentProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        setupNavigation()
        if let textField = inputTextField {
            UITextField.connectFields(fields: [textField])
            textField.becomeFirstResponder()
        }
    }
    
    private func setupNavigation() {
        navigationItem.title = "Add"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        if inputTextField.text?.isEmpty ?? true {
            return
        }
        delegate?.newGarmentAdded(garment: Garment(createdAt: Date(), garmentName: inputTextField.text ?? ""))
        navigationController?.popViewController(animated: true)
    }
}
