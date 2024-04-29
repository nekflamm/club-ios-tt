//
//  UITableView+Scroll.swift
//  Club
//
//  Created by Adrien Carvalot on 06/07/2022.
//

import UIKit

/** Extension used to manage the scroll on a `UITableView` */
extension UITableView {
    
    /**
     Scrolls to a given index path, at a given position, only if there's enough items in the section.
     - parameter indexPath: The index path to scroll to.
     - parameter scrollPosition: The position of the item at the end of the scroll.
     - parameter animated: Indicates whether the scroll is animated or not.
     */
    func safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        let numberOfRows = numberOfRows(inSection: indexPath.section)
        
        guard numberOfRows - 1 >= indexPath.row else {
            let message = "Cannot scroll to TableView item at index \(indexPath.item) with \(numberOfRows) items in section"
            return Log.record(message)
        }
        
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }

    /**
     Check if a row is existing for a given path
     - parameter indexPath: the indexPath which you want to test
     - returns: True/False if a row exists or not
     */
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < numberOfSections && indexPath.row < numberOfRows(inSection: indexPath.section)
    }

    /**
    Scroll to the top of the tableView
    - parameter animated: true/false, scrolling with a animation or not
     */
    func scrollToTop(animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: animated)
        }
    }
    
    /**
     Scroll to the bottom of the tableView.
     - parameter animated: Indicates whether the scroll should be animated.
     */
    func scrollToBottom(animated: Bool) {
        guard numberOfSections != 0 else { return }
        let section = max(numberOfSections - 1, 0)
        let row = max(numberOfRows(inSection: section) - 1, 0)
        let indexPath = IndexPath(row: row, section: section)
        
        if hasRowAtIndexPath(indexPath: indexPath) {
            scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
    }
    
}
