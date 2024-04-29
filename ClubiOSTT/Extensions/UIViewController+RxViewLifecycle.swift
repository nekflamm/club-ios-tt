//
//  UIViewController+RxViewLifecycle.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 16/10/2020.
//

import UIKit
import RxCocoa
import RxSwift

/**
 Reactive extension for `UIViewController`: https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Traits.md
 It permits to create ControlEvent for `UIViewController` base methods (like `viewWillAppear`)
 */
public extension Reactive where Base: UIViewController {

    /**
     Reactive wrapper for `viewWillAppear` message `UIViewController:viewWillAppear:`
     - returns: A `ControlEvent<Void>`
     */
    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { _ in }
        return ControlEvent(events: source)
    }

    /**
     Reactive wrapper for `viewWillDisappear` message `UIViewController:viewWillDisappear:`
     - returns: A `ControlEvent<Void>`
     */
    var viewWillDisappear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { _ in }
        return ControlEvent(events: source)
    }

    /**
     Reactive wrapper for `viewDidAppear` message `UIViewController:viewDidAppear:`
     - returns: A `ControlEvent<Void>`
     */
    var viewDidAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { _ in }
        return ControlEvent(events: source)
    }

    /**
     Reactive wrapper for `viewDidDisappear` message `UIViewController:viewDidDisappear:`
     - returns: A `ControlEvent<Void>`
     */
    var viewDidDisappear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { _ in }
        return ControlEvent(events: source)
    }
    
    /**
     Binder `isLoading` to set the ViewController to a loading state
     - returns: A `Binder<Bool>`
     */
    var isLoading: Binder<Bool> {
        return Binder(self.base) { controller, loading in
            loading ? controller.startLoading() : controller.stopLoading()
        }
    }
    
}
