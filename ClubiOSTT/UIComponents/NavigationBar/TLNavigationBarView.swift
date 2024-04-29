//
//  TLNavigationBarView.swift
//  Club
//
//  Created by Kévin Empociello on 12/10/2020.
//

import UIKit
import RxSwift
import RxCocoa

/** Navigation bar UI component with a progression */
class TLNavigationBarView: UIView {

    // MARK: - Properties

    /** Display mode to know how it has been displayed */
    var navigationDisplayMode: NavigationDisplayMode = .pushed {
        willSet {
            setupNavigationMode(to: newValue)
        }
    }

    /** String value to choose the title to be displayed */
    @IBInspectable var localizedTitle: String = "" {
        willSet {
            titleLabel.text = newValue.localized
        }
    }

    /** Boolean value to display a back button or not */
    @IBInspectable var hasLeftButton: Bool = true {
        willSet {
            leftButton.isHidden = !newValue
        }
    }
    
    /** The left button width, 40 by default */
    @IBInspectable var leftButtonWidth: Int = 40 {
        didSet {
            leftButtonWidthConstraint.constant = CGFloat(leftButtonWidth)
        }
    }
    
    /** The left image button, nil by default */
    @IBInspectable var leftButtonImage: UIImage? = UIImage(named: AssetsConstants.arrowLeft) {
        didSet {
            leftButton.setImage(leftButtonImage, for: UIControl.State())
        }
    }
    
    /** The left text button, nil by default */
    @IBInspectable var leftButtonText: String? {
        didSet {
            leftButton.setTitle(leftButtonText?.localized, for: UIControl.State())
        }
    }
    
    /** Boolean value to display the right button or not */
    @IBInspectable var hasRightButton: Bool = false {
        willSet {
            rightButton.isHidden = !newValue
        }
    }
    
    /** The right image button, nil by default */
    @IBInspectable var rightButtonImage: UIImage? {
        didSet {
            rightButton.setImage(rightButtonImage, for: UIControl.State())
        }
    }

    /** The right text button, nil by default */
    @IBInspectable var rightButtonText: String? {
        didSet {
            rightButton.setTitle(rightButtonText?.localized, for: UIControl.State())
        }
    }
    
    /** The right text color, nil by default */
    @IBInspectable var rightButtonColor: UIColor? {
        didSet {
            guard let rightButtonColor = rightButtonColor else { return }
            rightButton.tintColor = rightButtonColor
        }
    }

    /** Color to determine the main color of the button and title */
    @IBInspectable var mainColor: UIColor = .white {
        willSet {
            leftButton.tintColor = newValue
            rightButton.tintColor = newValue
            titleLabel.textColor = newValue
        }
    }

    // MARK: - IBOutlets

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak private var leftButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak private var topBarConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var indicatorView: TLRoundedView!
    
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        loadNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        topBarConstraint.constant = safeAreaInsets.top
    }

    // MARK: - Functions

    /** Making the link between this class and the nib file. */
    private func loadNib() {
        Bundle.main.loadNibNamed(String(describing: TLNavigationBarView.self), owner: self, options: nil)
        contentView.fitInView(self)
    }

    /** Setup view UI and design */
    private func setupNavigationMode(to mode: NavigationDisplayMode) {
        guard leftButtonText == nil else { return }
        
        if case .presented = mode {
            leftButton.setImage(UIImage(named: AssetsConstants.cross), for: .normal)
        } else if case .pushed = mode {
            leftButton.setImage(UIImage(named: AssetsConstants.arrowLeft), for: .normal)
        }
    }
}

/** Reactive extension to access properties through Rx */
extension Reactive where Base: TLNavigationBarView {

    /**
     Binder `navigationDisplayMode`.
     - returns: The `Binder<Bool>`.
     */
    var navigationMode: Binder<NavigationDisplayMode> {
        return Binder(base) { view, navigationDisplayMode in
            view.navigationDisplayMode = navigationDisplayMode
        }
    }

    /** Binder of navigation bar title text */
    var titleText: Binder<String?> {
        return Binder(base) { view, titleText in
            view.localizedTitle = titleText ?? ""
        }
    }

}
