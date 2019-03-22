//
//  CallerTableViewCell.swift
//  WhoIsThisKit
//
//  Created by Pavel Gnatyuk on 22/03/2019.
//  Copyright © 2019 Pavel Gnatyuk. All rights reserved.
//

import UIKit
import TheTool

class CallerTableViewCell: UITableViewCell, ReusableIdentifier {

    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelPhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelNote: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelNameConstraints: [NSLayoutConstraint] = {
        let marginGuide = contentView.layoutMarginsGuide
        return [
            labelName.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            labelName.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            labelName.topAnchor.constraint(equalTo: marginGuide.topAnchor)
        ]
    }()

    lazy var labelPhoneConstraints: [NSLayoutConstraint] = {
        let marginGuide = contentView.layoutMarginsGuide
        return [
            labelPhone.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            labelPhone.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            labelPhone.topAnchor.constraint(equalTo: labelName.topAnchor)
        ]
    }()

    lazy var labelNoteConstraints: [NSLayoutConstraint] = {
        let marginGuide = contentView.layoutMarginsGuide
        return [
            labelNote.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            labelNote.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            labelNote.topAnchor.constraint(equalTo: labelPhone.topAnchor)
        ]
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(labelName)
        addSubview(labelPhone)
        addSubview(labelNote)
        let constraints: [NSLayoutConstraint] = labelPhoneConstraints + labelNameConstraints + labelNoteConstraints
        NSLayoutConstraint.activate(constraints)
    }

}
