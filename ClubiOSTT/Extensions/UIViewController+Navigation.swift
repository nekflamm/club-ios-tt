//
//  UIViewController+Navigation.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

/** Extension to manage UIViewController navigation */
extension UIViewController {

    /**
     Shortcut to push a view controller from the current view controller
     - parameter viewController: The view controller to push
     */
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    /**
     Present a view controller in a navigation controller.
     - parameter viewController: The controller to set as rootVC in the navigation controller.
     - parameter modalPresentationStyle: The current `UIModalPresentationStyle` used to display the vc
     - parameter modalTransitionStyle: The current `UIModalTransitionStyle` used to display the vc
     - parameter isNavigationBarHidden: Indicates whether the navigation bar should be hidden or not.
     - parameter animated: Indicates whether the present should be animated or not.
     - parameter completion: The completion to call when the navigation controller will be presented.
     */
    func presentNavigationControllerWithRoot(_ viewController: UIViewController,
                                             modalPresentationStyle: UIModalPresentationStyle = .overFullScreen,
                                             modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
                                             isNavigationBarHidden: Bool = true,
                                             animated: Bool = true,
                                             completion: Completion? = nil) {

        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = isNavigationBarHidden
        navigationVC.modalPresentationStyle = modalPresentationStyle
        navigationVC.modalTransitionStyle = modalTransitionStyle

        present(navigationVC, animated: animated) {
            completion?()
        }
    }

    /**
     Shortcut to pop the current view controller
     */
    func pop() {
        navigationController?.popViewController(animated: true)
    }

    /**
     Find the last controller in controllers stack of a given type and then pop to it.
     - parameter controllerType: The type of the controller wanted.
     - parameter animated: Indicates whether the pop should be animated or not.
     */
    func popToController(_ controllerType: AnyClass, animated: Bool = true, completion: Completion? = nil) {
        if let controller = navigationController?.viewControllers.filter({ $0.isKind(of: controllerType) }).last {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            
            navigationController?.popToViewController(controller, animated: animated)
            
            CATransaction.commit()
        }
    }
    
    /**
     Dismiss or pop the current controller depending on its navigation mode.
     - parameter animated: Indicates whether the dismiss/pop is animated or not.
     - parameter completion: Completion called when view has been dismissed (only available for dismiss as pop has no completion)
     */
    func dismissOrPop(animated: Bool = true, completion: Completion? = nil) {
        if case .presented = getNavigationMode() {

            let dimissCompletion = {
                UIApplication.shared.currentKeyWindow?.layer.speed = 1

                completion?()
            }
            dismiss(animated: true, completion: dimissCompletion)
        } else {
            pop()
            completion?()
        }
    }

    /**
     Get the navigation mode of the current screen representing if the screen has been presented or pushed
     - returns: The mode of the navigation
     */
    func getNavigationMode() -> NavigationDisplayMode {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return .pushed
        } else if presentingViewController != nil {
            return .presented
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return .presented
        } else if tabBarController?.presentingViewController is UITabBarController {
            return .presented
        } else {
            return .pushed
        }
    }
    
    /**
     Navigate to a specific screen with given parameters
     - parameter navigate: The navigation details (screen, mode, animation)
     */
    func navigateTo(_ navigate: TLNavigate) {
        guard let controller: UIViewController = navigate.storyboard.getViewController() else {
            Log.record("Unable to navigate to \(navigate.storyboard)")
            return
        }
        
        if let controller = controller as? BaseViewController {
            /** Giving args to the next screen (or nil) */
            controller.args = navigate.args
        }
        
        switch navigate.mode {
        case .pushed:
            if let nvc = presentedViewController as? UINavigationController {
                nvc.pushViewController(controller, animated: navigate.animated)
            } else {
                push(controller, animated: navigate.animated)
            }
        case .presented:

            let completion = {
                UIApplication.shared.currentKeyWindow?.layer.speed = 1

                navigate.completion?()
            }

            if navigate.asNavRoot {
                presentNavigationControllerWithRoot(controller,
                                                    modalPresentationStyle: navigate.presentation,
                                                    modalTransitionStyle: navigate.transitionStyle,
                                                    animated: navigate.animated,
                                                    completion: completion)
            } else {
                controller.modalPresentationStyle = navigate.presentation
                controller.modalTransitionStyle = navigate.transitionStyle
                controller.isModalInPresentation = !navigate.canBeDismissedByGesture

                present(controller, animated: navigate.animated, completion: completion)
            }
        case .custom:
            controller.transitioningDelegate = self
            present(controller, animated: navigate.animated, completion: navigate.completion)
        case .root(let delay):
            let mainVC: UIViewController
            if navigate.asNavRoot {
                mainVC = UINavigationController(rootViewController: controller)
            } else {
                mainVC = controller
            }

            (mainVC as? UINavigationController)?.isNavigationBarHidden = true

            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                /** Removes any child/presented vc that could still be displayed and then add the new one */
                self.presentedViewController?.dismiss(animated: false)
                self.children.forEach { $0.removeChild() }

                self.addChild(mainVC, container: self.view)

                navigate.completion?()
            }
        }
    }
    
    /**
     Closing the screen depending on the parameters
     - parameter parameter: Closing infos
     */
    func handleClose(with parameter: TLNavigateClose) {
        if parameter.popToRoot {
            navigationController?.popToRootViewController(animated: parameter.animated)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                parameter.completion?()
            }
        } else if let controllerClass = parameter.popToController {
            popToController(controllerClass, completion: parameter.completion)
        } else if parameter.forceDismiss {

            let completion = {
                UIApplication.shared.currentKeyWindow?.layer.speed = 1

                parameter.completion?()
            }
            dismiss(animated: parameter.animated, completion: completion)
        } else {
            dismissOrPop(animated: parameter.animated, completion: parameter.completion)
        }
    }
    
    /**
     Force the current responder (ex: UITextField) to resign
     */
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    /**
     Action called to pop the current view controller (when tapping on the application custom back button for instance)
     */
    @IBAction func didTouchBack(_ sender: Any) {
        pop()
    }

}

/** Extension used to manage the custom transition delegate for menu bottom sheet */
extension UIViewController: UIViewControllerTransitioningDelegate {

    /** Refers to the `animationController` of the `UIViewControllerTransitioningDelegate`  */
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }

    /** Refers to the `animationController` of the `UIViewControllerTransitioningDelegate`  */
    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }

}
