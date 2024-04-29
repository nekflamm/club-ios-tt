//
//  ContentRequestTableViewCell.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import UIKit

/** Cell displaying a content request that a creator has pre-defined and that a user can request */
class ContentRequestTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    // MARK: - Functions
    
    /**
     Configure the cell with a given model.
     - parameter model: The model containing all the needed data to setup the cell.
     */
    func configure(with model: ContentRequestUI) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        descriptionLabel.isHidden = model.description == nil
        priceLabel.text = model.price
    }
}
