//
//  UITableView+Loading.swift
//  Club
//
//  Created by Kevin on 07/01/2021.
//

import UIKit

/**
 Extension which permits to add / hide a `LoadMoreView`
 for the `UITableView` header or footer
 */
extension UITableView {

    // MARK: - Footer

    /**
     Add a `LoadMoreView` in the `tableFooterView`
     - parameter marginTop: The top margin of the loader
     - parameter marginBottom: The bottom margin of the loader
     - returns: The created `LoadMoreView`
     */
    func addLoadMoreFooter(marginTop: CGFloat = 8.0,
                           marginBottom: CGFloat = 24.0) -> LoadMoreView {
        let footer = LoadMoreView(width: self.frame.size.width,
                                  marginTop: marginTop,
                                  marginBottom: marginBottom)
        self.tableFooterView = footer
        return footer
    }

    /**
     Remove the `LoadMoreView` from the `tableFooterView`
     */
    func removeLoadMoreFooter() {
        self.tableFooterView = nil
    }

    // MARK: - Header

    /**
     Add a `LoadMoreView` in the `tableHeaderView`
     - parameter marginTop: The top margin of the loader
     - parameter marginBottom: The bottom margin of the loader
     - returns: The created `LoadMoreView`
     */
    func addLoadMoreHeader(marginTop: CGFloat = 8.0,
                           marginBottom: CGFloat = 24.0) -> LoadMoreView {
        let header = LoadMoreView(width: self.frame.size.width,
                                  marginTop: marginTop,
                                  marginBottom: marginBottom)
        self.tableHeaderView = header
        
        return header
    }

    /**
     Remove the `LoadMoreView` from the `tableHeaderView`
     */
    func removeLoadMoreHeader() {
        self.tableHeaderView = nil
    }
}
