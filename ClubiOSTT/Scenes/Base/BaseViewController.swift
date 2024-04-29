//
//  BaseViewController.swift
//  Boilerplate
//
//  Created by Kevin on 03/12/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

/** Protocol which implementation is mandatory to works with MVVM pattern and Rx */
protocol BaseViewControllerLogic {

    /** Get the optional `BaseViewModel` */
    func getViewModel() -> BaseViewModel?

    /** Callback to bind view model to UI */
    func bindViewModel()
}

/**
 Base `UIViewController` which works with MVVM pattern and Rx
 It will automatically bind/unbind VC to VM to avoid mistakes in the future
 */
class BaseViewController: UIViewController {

    // MARK: - Properties

    /** Dispose all observers subscribed in `bindViewModel` function */
    var disposeBag = DisposeBag()
    
    /** Specific arguments needed by the screen */
    var args: Any?

    /**
     Enable binding / unbinding
     - True: bind on viewWillAppear, unbind on viewWillDisappear
     - False: bind on viewDidLoad, never unbinded
     */
    var enableBindUnbind: Bool { true }
    
    /** Keyboard binding related properties */
    var _isKeyboardDisplayed: Bool = false
    var _currentKeyboardHeight: CGFloat = 0
    var _bottomConstraint: NSLayoutConstraint?
    
    /** A boolean to make sure we don't bind the screen multiple times */
    private var didAppear: Bool = false

    // MARK: - IBOutlets

    @IBOutlet var fields: [UITextInput]?

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        if !enableBindUnbind {
            bind()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if enableBindUnbind {
            guard !didAppear else { return }
            self.didAppear = true
            
            bind()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if enableBindUnbind {
            self.didAppear = false
            unbind()
        }
        
        super.viewDidDisappear(animated)
    }

    // MARK: - Functions

    /**
     Select the next input (textfield or textview) depending of the current input selected
     - parameter index: The current index of responder input
     */
    func selectNextInputs(at index: Int) {
        guard index + 1 < (fields?.count ?? 0) else {
            Log.i("no more textfields / textview to select")
            view.endEditing(true)

            return
        }

        if let textView = fields?[index + 1] as? UITextView {
            textView.becomeFirstResponder()
        } else if let texField = fields?[index + 1] as? UITextField {
            texField.becomeFirstResponder()
        }
    }
    
    // MARK: - Private functions

    /** Setup view, design and UI */
    private func setupView() {
        configureFieldsIfNeeded()
    }

    /** Each time the view will appear, bind the view model */
    private func bind() {
        let input = BaseViewModel.Input(viewDidAppear: rx.viewDidAppear,
                                        isLoading: rx.isLoading)
        
        if let output = getViewModel()?.transform(input: input) {
            
            /** Listen to navigation needed by the viewModel */
            output.navigate.filterNil().drive(onNext: { [unowned self] navigate in
                self.navigateTo(navigate)
            }).disposed(by: disposeBag)
            
            /** Getting notified when we should close the screen */
            output.close.filterNil().drive(onNext: { [unowned self] closeDetails in
                self.handleClose(with: closeDetails)
            }).disposed(by: disposeBag)
            
            /** Get driven by a `TLPopupViewModel` containing the needed data to display the alerts */
            output.popup.filterNil().drive(onNext: { [unowned self] popupViewModel in
                self.handleDisplayPopup(popupViewModel: popupViewModel)
            }).disposed(by: disposeBag)
            
        } else {
            Log.record("Unable to bind the output - nil value")
        }
        
        bindViewModel()
    }

    /** Each time the view did disappear, unbind the view model */
    private func unbind() {
        getViewModel()?.unbind()
        disposeBag = DisposeBag()
    }

    /** Configure the fields stored into the `IBOutlet` to set the `returnKeyType` */
    private func configureFieldsIfNeeded() {
        guard let fields = fields, !fields.isEmpty else {
            Log.i("There is no textviews registered into the BaseViewController `fields` to implement next textviews logic")
            return
        }

        /** For each textfield or textview containing into the fields, we set the `returnKeyType`
         of the current field. To define a textview without multilines you should set
         the returnKeyType into the child VC. */
        fields.enumerated().forEach { (idx, option) in
            if fields.count - 1 == idx {
                (option as? UITextView)?.returnKeyType = .default
                (option as? UITextField)?.returnKeyType = .done
            } else {
                (option as? UITextView)?.returnKeyType = .default
                (option as? UITextField)?.returnKeyType = .next
            }
        }
    }
}

// MARK: - Extension BaseViewControllerLogic

extension BaseViewController: BaseViewControllerLogic {

    /** Refers to the `unbindViewModel` function of the `RxViewControllerLogic` */
    @objc func getViewModel() -> BaseViewModel? {
        fatalError("getViewModel should be implemented")
    }

    /** Refers to the `bindViewModel` function of the `RxViewControllerLogic` */
    @objc func bindViewModel() {
        fatalError("bindViewModel should be implemented")
    }
}

// MARK: - Extension UIGestureRecognizerDelegate

extension BaseViewController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }

}
