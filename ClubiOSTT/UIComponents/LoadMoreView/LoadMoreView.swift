//
//  LoadMoreView.swift
//  Club
//
//  Created by Kevin on 07/01/2021.
//

import UIKit
import NVActivityIndicatorView

/**
 `UIView` used to load more items (in a list for instance)
 Will manage two states:
 - Loading state (activity indicator)
 - Error state with a button to retry the loading
 */
class LoadMoreView: UIView {

    // MARK: - IBOutlets

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var retryButton: UIButton!

    @IBOutlet weak var marginTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var marginBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    /** The delegate used to send some information (button tap for instance) */
    weak var delegate: LoadMoreViewDelegate?

    /** Loading flag. Will show the corresponding `UIView` */
    var loading: Bool = true {
        didSet {
            loadingView.isHidden = !loading
            errorView.isHidden = loading
            if loading {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }

    // MARK: - Initializers

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        loadNib()

        /** Set the dynamic constraints */
        marginTopConstraint.constant = 0.0
        marginBottomConstraint.constant = 0.0

        self.layoutIfNeeded()
    }

    init(width: CGFloat,
         marginTop: CGFloat = 8.0,
         marginBottom: CGFloat = 16.0) {

        /** Set the frame of the `LoadMoreView` */
        let height = 40 + marginTop + marginBottom
        let frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        super.init(frame: frame)

        loadNib()

        /** Set the dynamic constraints */
        marginTopConstraint.constant = marginTop
        marginBottomConstraint.constant = marginBottom

        self.layoutIfNeeded()
    }

    // MARK: - Functions

    /**
     Making the link between this class and the nib file.
     */
    func loadNib() {
        Bundle.main.loadNibNamed("LoadMoreView", owner: self, options: nil)
        contentView.fitInView(self)
    }

    // MARK: - IBActions

    @IBAction func didTouchRetry() {
        delegate?.didTouchRetryButton()
    }
}
