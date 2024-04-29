//
//  UITableView+HeaderFooter.swift
//  Club
//
//  Created by Florian Pygmalion on 11/01/2022.
//

import UIKit

/** TableView extension to manage header footer registration and dequeue */
extension UITableView {

    /**
     Register HeaderFooter nib to this tableview
     - parameter cell: Cell type
     - parameter bundle: Optional `Bundle`
     */
    func registerNibFor(_ header: UITableViewHeaderFooterView.Type, bundle: Bundle? = nil) {
        let nibName = String(describing: header)
        register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: String(describing: header))
    }

    /**
     Dequeue HeaderFooter of type `headerType`
     - parameter headerType: Type of the HeaderFooter
     */
    func dequeueHeader<T: UITableViewHeaderFooterView>(_ headerType: T.Type) -> T {
        // swiftlint:disable:next force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: headerType)) as! T
    }

}
