//
//  BannerView.swift
//  Club
//
//  Created by Florian Pygmalion on 07/09/2022.
//

import UIKit

/** View used to display some informations as banner */
class BannerView: UIView {

    // MARK: - IBOutlets

    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var titleImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    // MARK: - Functions

    /**
     Configure the view with the given model
     - parameter modelUI: The `BannerViewUI` to display
     */
    func configure(with modelUI: BannerViewUI) {
        titleImage.image = UIImage(named: modelUI.isPositive ? "checkmark" : "stop")
        titleLabel.text = modelUI.title
        contentView.backgroundColor = modelUI.isPositive ? UIColor.custom.positive : UIColor.custom.negative
    }

    // MARK: - Private functions

    /** Common setup design */
    private func setupView() {
        Bundle.main.loadNibNamed(String(describing: BannerView.self), owner: self, options: nil)
        contentView.fitInView(self)
    }

}
