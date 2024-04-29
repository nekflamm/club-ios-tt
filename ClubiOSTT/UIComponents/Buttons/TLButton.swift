//
//  TLButton.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit
import RxSwift

/** Common main action button of the Boilerplate app */
class TLButton: HapticButton {

    // MARK: - Interne template enum

    /** Boilerplate button different templates */
    enum Template: Int {
        case lime
        case white
        case darkGray
        case grayBordered
        case limeBordered
        case gray08
        case semiBoldGray07Bordered
        case supportingPurple
    }

    // MARK: - Designables
    
    @IBInspectable var templateAdapter: Int {
        get {
            return self.template.rawValue
        }
        set(templateIndex) {
            self.template = Template(rawValue: templateIndex) ?? .lime
        }
    }

    // MARK: - Properties

    /** Current template used in term of design */
    var template: Template = .lime {
        didSet {
            setTemplate(template: template)
        }
    }

    /** Store locally the last enable state to avoid redraw views */
    var lastEnableState: Bool = true

    /** Overriding the enable property to change the design */
    override var isEnabled: Bool {
        didSet {
            if isEnabled != lastEnableState {
                setEnable(isEnabled)
                lastEnableState = isEnabled
            }
        }
    }
    
    /** Store locally the last custom highlight state to avoid redraw views */
    var lastHighlightState: Bool = false
    
    /** Custom highlight property to change the design, we don't want the native one to prevent native UI changes */
    var customHighlight: Bool = false {
        didSet {
            if customHighlight != lastHighlightState {
                setTemplate(template: template)
                lastHighlightState = customHighlight
            }
        }
    }

    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupButton()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupButton()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 6
    }

    /** Overriding setTitle method to disable the animation when the title change to the localized version */
    override func setTitle(_ title: String?, for state: UIControl.State) {
        UIView.performWithoutAnimation {
            super.setTitle(title, for: state)
            self.layoutIfNeeded()
        }
    }

    // MARK: - Functions

    /** Common setup design */
    private func setupButton() {
        setTemplate(template: template)
    }

    /**
    To enable or not the button automatically changing the colors to gray
     - parameter value: Boolean value enable or not
    */
    private func setEnable(_ value: Bool) {
        isUserInteractionEnabled = value

        /** Resetting the template which will check the enable value*/
        setTemplate(template: template)
    }

    /**
     Setup the button design
     - parameter template: The design template choosen refers to the `Template` enum
    */
    // swiftlint:disable:next superfluous_disable_command
    private func setTemplate(template: Template) {
        clearUI()

        switch template {
        case .lime:
            limeTemplate()
        case .white:
            whiteTemplate()
        case .darkGray:
            darkGrayTemplate()
        case .grayBordered:
            grayBorderedTemplate()
        case .limeBordered:
            limeBorderedTemplate()
        case .gray08:
            darkGray08Template()
        case .semiBoldGray07Bordered:
            semiBoldGray07BorderedTemplate()
        case .supportingPurple:
            supportingPurpleTemplate()
        }
    }

    /** Setting up the design of the button for the `grayBordered` template */
    private func grayBorderedTemplate() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = isEnabled ? .clear : .clear
        titleLabel?.font = .bold(size: 14)
        layer.borderWidth = 1
        layer.borderColor = UIColor.custom.gray07.cgColor
    }
    
    /** Setting up the design of the button for the `limeBorderedTemplate` template */
    private func limeBorderedTemplate() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = isEnabled ? .clear : .clear
        titleLabel?.font = .semiBold(size: 17)
        layer.borderWidth = 1
        layer.borderColor = UIColor.custom.lime.cgColor
    }
    
    /** Setting up the design of the button for the `lime` template */
    private func limeTemplate() {
        tintColor = .black
        setTitleColor(.black, for: UIControl.State())
        backgroundColor = isEnabled ? .custom.lime : .custom.limeDisabled
        titleLabel?.font = .heavy(size: 17)
    }

    /** Setting up the design of the button for the `white` template */
    private func whiteTemplate() {
        tintColor = .black
        setTitleColor(.black, for: UIControl.State())
        backgroundColor = .white
        titleLabel?.font = .heavy(size: 17)
    }
    
    /** Setting up the design of the button for the `darkGrayTemplate` template */
    private func darkGrayTemplate() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = .custom.gray07
        titleLabel?.font = .heavy(size: 17)
        alpha = isEnabled ? 1.0 : 0.25
    }

    /** Setting up the design of the button for the `darkGray08Template` template */
    private func darkGray08Template() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = .custom.gray08
        titleLabel?.font = .bold(size: 17)
        alpha = isEnabled ? 1.0 : 0.25
    }
    
    /** Setting up the design of the button for the `semiBoldGray07BorderedTemplate` template */
    private func semiBoldGray07BorderedTemplate() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = isEnabled ? .clear : .clear
        titleLabel?.font = .semiBold(size: 17)
        layer.borderWidth = 1
        layer.borderColor = UIColor.custom.gray07.cgColor
    }
    
    /** Setting up the design of the button for the `supportingPurple` template */
    private func supportingPurpleTemplate() {
        tintColor = .white
        setTitleColor(.white, for: UIControl.State())
        backgroundColor = .custom.supportingPurple
        titleLabel?.font = .heavy(size: 17)
    }
    
    /** Clear the layers to re start from scratch */
    private func clearUI() {
        clipsToBounds = false
        layer.borderWidth = 0
        layer.removeShadow()
        titleLabel?.layer.removeShadow()
    }
}

// MARK: - Reactive extension

extension Reactive where Base: TLButton {
    
    /**
     Binder `isHighlighted` to set the button to a custom highlight state
     - returns: A `Binder<Bool>`
     */
    var isHighlighted: Binder<Bool> {
        return Binder(self.base) { button, isHighlighted in
            button.customHighlight = isHighlighted
        }
    }
    
}
