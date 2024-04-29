//
//  WelcomeViewModel.swift
//  Club
//
//  Created by Kévin Empociello on 02/06/2021.
//

import RxSwift
import RxCocoa

/** ViewModel used by `WelcomeViewController` */
class WelcomeViewModel: BaseViewModel {

    // MARK: - Input/Output

    struct Input {
        let continueTap: ControlEvent<Void>
        let subtitleText: Binder<String?>
    }

    struct Output {
    }

    // MARK: - Private Properties

    // MARK: - Functions

    /**
     Transforming `WelcomeViewModel.Input` given by the `WelcomeViewController`
     into `WelcomeViewModel.Output` get by the `WelcomeViewController`
     - parameter input: object which refers to the `WelcomeViewModel.Input` structure
     - returns: The output created from the input
     */
    func transform(input: Input) -> Output {

        /** Setup the Analytics events logging */
        setupAnalytics(with: input)

        /** Get the continue tap event to switch to the next screen for a given login method */
        input.continueTap
            .subscribe(onNext: { self.displayNextScreen() })
            .disposed(by: disposeBag)

        return Output()
    }

    // MARK: - Private functions
    
    private func displayNextScreen() {
        navigate.onNext(TLNavigate(.RequestsList, mode: .presented, asNavRoot: true, args: nil))
    }
}
