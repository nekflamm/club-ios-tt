//
//  TLPopupViewController.swift
//  Boilerplate
//
//  Created by Kevin Empociello on 11/10/2019.
//  Copyright © 2019 Kevin Empociello. All rights reserved.
//

import UIKit

/**
 Custom Popup reuse in the app.
 Automatically changing depends on the title, message, and action/close.
*/
class TLPopupViewController: UIViewController {

    // MARK: - Properties

    /** View model for the popup that are including all the data to custom the popup */
    let viewModel: TLPopupViewModel
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var closeButton: TLButton!
    @IBOutlet weak var actionButton: TLButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var buttonStackView: UIStackView!

    // MARK: - Initializers
    
    init(viewModel: TLPopupViewModel) {
        self.viewModel = viewModel

        super.init(nibName: String(describing: TLPopupViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Functions
    
    /**
     Updating the availables buttons and setting the texts
     According to the titles given or not in the initialiser.
     */
    func setupView() {
        if viewModel.isInverted { // Switches order of the stackView
            buttonStackView.addArrangedSubview(buttonStackView.subviews[0])
        }

        contentView.backgroundColor = viewModel.template.getBackgroundColor()
        titleLabel.text = viewModel.title?.localized
        closeButton.isHidden = true
        actionButton.isHidden = true

        if viewModel.icon == .none {
            iconImageView.isHidden = true
        } else {
            iconImageView.image = UIImage(named: viewModel.icon.rawValue)
            iconImageView.tintColor = viewModel.template.getIconTintColor()
            iconImageView.isHidden = false
        }
        
        if let closeTitle = viewModel.close {
            closeButton.template = viewModel.template.getCloseButtonTemplate()
            closeButton.setTitle(closeTitle.localized, for: .normal)
            closeButton.titleLabel?.font = .bold(size: 16)
            closeButton.isHidden = false
        }
        
        if let actionTitle = viewModel.action {
            actionButton.template = viewModel.template.getActionButtonTemplate()
            actionButton.setTitle(actionTitle.localized, for: .normal)
            actionButton.titleLabel?.font = .bold(size: 16)
            actionButton.isHidden = false
        }
        
        if let message = viewModel.message {
            messageLabel.text = message.localized
        } else {
            messageLabel.isHidden = true
        }
        
        if viewModel.isDismissible {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureOnBackground))
            view.addGestureRecognizer(tapGesture)
        }

        titleLabel.textColor = viewModel.template.getTitleColor()
        titleLabel.font = viewModel.template.getTitleFont()
        messageLabel.textColor = viewModel.template.getMessageColor()
        messageLabel.font = viewModel.template.getMessageFont()
    }
    
    // MARK: - Actions
    
    /** Left button (close) action */
    @IBAction func didTouchClose(_ sender: Any) {
        if viewModel.autoHide {
            dismiss(animated: true) {
                self.viewModel.closeCompletion?()
            }
        }
    }

    /** Right button action */
    @IBAction func didTouchAction(_ sender: Any) {
        if viewModel.autoHide {
            dismiss(animated: true) {
                self.viewModel.actionCompletion?()
            }
        }
    }
    
    /** Handles the tap gesture to dismiss self if needed. */
    @objc private func handleTapGestureOnBackground(_ gesture: UIGestureRecognizer) {
        
        /** Checking if the tap gesture was made on background view */
        if !contentView.frame.contains(gesture.location(in: view)) {
            dismiss(animated: true)
        }
    }
    
}
