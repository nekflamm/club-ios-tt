//
//  UITableView+UITableViewCell.swift
//  Club
//
//  Created by Florian Pygmalion on 10/01/2022.
//

import UIKit

/** TableView extension to manage cell registration and dequeue */
extension UITableView {

    /**
     Register nib to this tableview
     - parameter cell: Cell type
     - parameter bundle: Optional `Bundle`
     */
    func registerNib(_ cell: UITableViewCell.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: String(describing: cell), bundle: bundle), forCellReuseIdentifier: String(describing: cell))
    }

    /**
     Dequeue cell of type `cellType` at the specified `indexPath`
     - parameter cellType: Type of the cell
     - parameter indexPath: Index path of the row
     */
    func dequeueCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
    }

}
