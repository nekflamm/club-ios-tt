//
//  WelcomeViewController.swift
//  Club
//
//  Created by Kévin Empociello on 05/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

/** Controller engaging the user to start using the app, simple action */
class WelcomeViewController: BaseViewController {
    
    // MARK: - Private properties

    /** View model created by dependency injection */
    private let viewModel = WelcomeViewModel()

    // MARK: - Override properties

    /** Disables the automatic bind unbind because we doesn't want call multiple times the data */
    override var enableBindUnbind: Bool { false }

    // MARK: - IBOutlets

    @IBOutlet weak private var subtitleLabel: UILabel!
    @IBOutlet weak private var continueButton: TLButton!
    @IBOutlet weak private var legalTextView: UITextView!
    @IBOutlet weak private var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK: - Override functions

    /** Refers to the `getViewModel` of the `BaseViewModel` */
    override func getViewModel() -> BaseViewModel? {
        return viewModel
    }

    /** Refers to the `bindViewModel` of the `BaseViewModel` */
    override func bindViewModel() {
        let input = WelcomeViewModel.Input(continueTap: continueButton.rx.tap,
                                           subtitleText: subtitleLabel.rx.text)
        
        let _ = viewModel.transform(input: input)
    }

    // MARK: - Functions
    
    /** Setup the views */
    private func setupView() {}
    
}
