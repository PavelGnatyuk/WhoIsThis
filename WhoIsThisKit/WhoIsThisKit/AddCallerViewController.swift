//
//  AddCallerViewController.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 24/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

protocol AddCallerViewControllerDelegate: class {
    func onClose(viewController: UIViewController, viewModel: CallerViewModel)
}

class AddCallerViewController: UIViewController {

    let theme: Theme
    private var viewModel: CallerViewModel
    weak var delegate: AddCallerViewControllerDelegate?

    lazy var addCallerView: AddCallerView = {
        let view = AddCallerView()
        view.backgroundColor = theme.main.backgroundColor

        view.textFieldName.text = viewModel.name
        view.textFieldName.keyboardType = .namePhonePad
        
        view.textFieldPhone.text = viewModel.phone
        view.textFieldPhone.keyboardType = .namePhonePad

        view.textViewNote.text = viewModel.note
        
        // To make Done button switch between the textfields
        view.textFieldName.delegate = self
        view.textFieldPhone.delegate = self
        view.textFieldName.tag = TextTags.name.rawValue
        view.textFieldPhone.tag = TextTags.phone.rawValue
        view.textViewNote.tag = TextTags.note.rawValue
        
        view.textFieldName.becomeFirstResponder()
        return view
    }()
    
    init(viewModel: CallerViewModel, theme: Theme) {
        self.viewModel = viewModel
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func loadView() {
        view = addCallerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = viewModel.title
    }
}

fileprivate extension AddCallerViewController {
    func addBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tapOnSave(_:)))
        enableSave()
    }
    
    @objc func tapOnSave(_ sender: AnyObject?) {
        let modified = viewModel.hasModified
        if modified {
            save()
        }
        delegate?.onClose(viewController: self, viewModel: viewModel)
    }
    
    func enableSave() {
        navigationItem.rightBarButtonItem?.isEnabled = viewModel.hasModified
    }
}

// MARK: - UITextFieldDelegate for the text field.

extension AddCallerViewController: UITextFieldDelegate {
    // The edit cursor is visible but the editing is disabled
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField as? ThemedTextField) != nil {
            // This is the list text field. All other text fields are of type EditTextField.
            // Another way to detect the list text field is byt its tag.
            return true
        }
        return false
    }
    
    // Switch to the next text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        debugPrint("\(#function). TextField: \(textField)")
        guard let editTextField = textField as? ThemedTextField else {
            return true
        }
        let nextTag = editTextField.tag + 1
        if let nextResponder = view.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        }
        else {
            editTextField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        debugPrint("\(#function). TextField: \(textField)")
        updateViewModelFromTextField(with: textField.tag)
        // Update the Save button
        enableSave()
    }
}

fileprivate extension AddCallerViewController {
    func updateViewModelFromTextField(with tag: Int) {
        debugPrint("\(#function). Tag: \(tag)")
        guard let textTag = TextTags(rawValue: tag) else {
            assert(false, "Unexpected tag of a text field")
            return
        }
        guard let textField = view.viewWithTag(tag) as? UITextField else {
            assert(false, "Text field for tag \(tag) not found")
            return
        }
        
        let text = textField.text ?? ""
        switch textTag {
        case .name:
            viewModel.name = text
            
        case .phone:
            viewModel.phone = text

        default:
            assert(false, "Unexpected tag \(textTag)")
        }
    }
    
    func updateNoteFrom(textView: UITextView) {
        guard let text = textView.text else {
            debugPrint("No text in the Note textview found")
            return
        }
        viewModel.note = text
    }
    
    func save() {
        debugPrint("\(#function)")
        updateNoteFrom(textView: addCallerView.textViewNote)
    }
    
}

// MARK: - Constants

fileprivate enum TextTags: Int {
    case name = 1000
    case phone
    case note
}
