//
//  TLLoadingView.swift
//  Club
//
//  Created by Kévin Empociello on 21/02/2020.
//  Copyright © 2020 Kevin Empociello. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

/** View representing a loading indicator framed in a rounded square */
class TLLoadingView: UIView {

    // MARK: - IBOutlets

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var containerView: TLDesignableView!
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!

    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)

        loadNib()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Make the link between this class and the nib file.
     Add the view to the `contentView` and  setup the design, start loading.
    */
    func loadNib() {
        Bundle.main.loadNibNamed(String(describing: TLLoadingView.self), owner: self, options: nil)

        contentView.fitInView(self)
        activityIndicator.startAnimating()

        if #available(iOS 12.0, *) {
        } else {
            layer.addShadow(offset: CGSize(width: 0, height: 0), opacity: 0.1, radius: 20)
        }
    }
}
