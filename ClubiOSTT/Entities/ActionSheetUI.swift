//
//  ActionSheetUI.swift
//  Club
//
//  Created by Florian Pygmalion on 17/01/2022.
//

/** Struct containing the needed datas to create an actionSheet. */
struct ActionSheetUI {

    // MARK: - Properties

    var title: String?
    var message: String?
    let actions: [AlertAction]
    var dismissCompletion: Completion?

}
