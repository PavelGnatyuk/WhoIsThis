//
//  AddCallerView.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 24/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTheme

class AddCallerView: UIView {

    lazy var labelName: UILabel = {
        let label = ThemedLabel()
        label.text = "Name:"
        return label
    }()
    
    var labelNameLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            labelName.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            labelName.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            labelName.topAnchor.constraint(equalTo: guide.topAnchor, constant: .verticalSpacing)
        ]
    }
    
    lazy var textFieldName: UITextField = {
        let textField = ThemedTextField()
        textField.placeholder = "Name"
        return textField
    }()
    
    var textFieldNameLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            textFieldName.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: .verticalSpacing)
        ]
    }

    lazy var labelPhone: UILabel = {
        let label = ThemedLabel()
        label.text = "Phone:"
        return label
    }()
    
    var labelPhoneLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            labelPhone.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            labelPhone.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            labelPhone.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: .verticalSpacing)
        ]
    }

    lazy var textFieldPhone: UITextField = {
        let textField = ThemedTextField()
        textField.placeholder = "Phone"
        return textField
    }()
    
    var textFieldPhoneLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            textFieldPhone.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textFieldPhone.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            textFieldPhone.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: .verticalSpacing)
        ]
    }

    lazy var labelNote: UILabel = {
        let label = ThemedLabel()
        label.text = "Note:"
        return label
    }()
    
    var labelNoteLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            labelNote.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            labelNote.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            labelNote.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: .verticalSpacing)
        ]
    }
    
    lazy var textViewNote: UITextView = {
        let textView = ThemedTextView()
        return textView
    }()
    
    var textViewNoteLayoutConstraints: [NSLayoutConstraint] {
        let guide = layoutMarginsGuide
        return [
            textViewNote.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textViewNote.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            textViewNote.topAnchor.constraint(equalTo: labelNote.bottomAnchor, constant: .verticalSpacing),
            textViewNote.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -.verticalSpacing)
        ]
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setup() {
        addSubview(labelName)
        addSubview(textFieldName)
        addSubview(labelPhone)
        addSubview(textFieldPhone)
        addSubview(labelNote)
        addSubview(textViewNote)
        var constraints = [NSLayoutConstraint]()
        constraints += labelNameLayoutConstraints
        constraints += textFieldNameLayoutConstraints
        constraints += labelPhoneLayoutConstraints
        constraints += textFieldPhoneLayoutConstraints
        constraints += labelNoteLayoutConstraints
        constraints += textViewNoteLayoutConstraints
        NSLayoutConstraint.activate(constraints)
    }
}


private extension CGFloat {
    static let verticalSpacing: CGFloat = 8
}
