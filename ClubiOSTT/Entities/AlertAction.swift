//
//  AlertAction.swift
//  Club
//
//  Created by Florian Pygmalion on 17/01/2022.
//

import UIKit

/** Struct containin the needed data to create an UIAlertAction */
struct AlertAction {

    // MARK: - Properties

    let title: String
    var imageName: String?
    var style: UIAlertAction.Style = .default
    let action: () -> Void

}
