//
//  TLPopupViewModel.swift
//  Boilerplate
//
//  Created by Kevin on 09/01/2020.
//  Copyright © 2020 Kevin Empociello. All rights reserved.
//

import Foundation

/** Enum to list all available icons (stored in Assets.xcassets) */
enum TLIcon: String {
    case none
    case alert
    case success
}

/** Class which manages of `TLPopupViewModel` */
struct TLPopupViewModel {
    let icon: TLIcon
    let template: TLPopupTemplate
    let title: String?
    let message: String?
    let close: String?
    let action: String?
    let closeCompletion: Completion?
    let actionCompletion: Completion?
    let presentedCompletion: Completion?
    let autoHide: Bool
    let isInverted: Bool
    let isDismissible: Bool

    init(icon: TLIcon,
         template: TLPopupTemplate,
         title: String?,
         message: String?,
         close: String?,
         action: String?,
         closeCompletion: Completion?,
         actionCompletion: Completion? = nil,
         presentedCompletion: Completion? = nil,
         autoHide: Bool = true,
         isInverted: Bool = false,
         isDismissible: Bool = false) {

        self.icon = icon
        self.template = template
        self.title = title
        self.message = message
        self.close = close
        self.action = action
        self.closeCompletion = closeCompletion
        self.actionCompletion = actionCompletion
        self.presentedCompletion = presentedCompletion
        self.autoHide = autoHide
        self.isInverted = isInverted
        self.isDismissible = isDismissible
    }
}

extension TLPopupViewModel {
    
    /** Build an error popup view model */
    static func error(message: String,
                      template: TLPopupTemplate = .white,
                      closeCompletion: Completion? = nil) -> TLPopupViewModel {
        return TLPopupViewModel(icon: .alert,
                                template: template,
                                title: "common.error",
                                message: message,
                                close: "common.ok",
                                action: nil,
                                closeCompletion: closeCompletion,
                                isDismissible: true)
    }
    
    /** Build a try again error popup view model */
    static func tryAgain(message: String,
                         actionCompletion: Completion? = nil,
                         closeCompletion: Completion? = nil) -> TLPopupViewModel {
        
        return TLPopupViewModel(icon: .none,
                                template: .dark,
                                title: "common.whoops",
                                message: message,
                                close: "common.cancel",
                                action: "common.tryagain",
                                closeCompletion: closeCompletion,
                                actionCompletion: actionCompletion)
    }
    
    /** Build a discard popup view model */
    static func discard(backCompletion: Completion? = nil,
                        stayCompletion: Completion? = nil) -> TLPopupViewModel {
        
        return TLPopupViewModel(icon: .none,
                                template: .dark,
                                title: "common.discard.alert.title",
                                message: "common.discard.alert.message",
                                close: "common.discard.alert.stay",
                                action: "common.discard.alert.back",
                                closeCompletion: stayCompletion,
                                actionCompletion: backCompletion)
    }
    
    static func exclusiveConfirmation(closeCompletion: Completion? = nil,
                                      actionCompletion: Completion? = nil) -> TLPopupViewModel {
        
        return TLPopupViewModel(icon: .none,
                                template: .dark,
                                title: "exclusivePost.popup.title",
                                message: "exclusivePost.popup.desc",
                                close: "common.cancel",
                                action: "common.yes",
                                closeCompletion: closeCompletion,
                                actionCompletion: actionCompletion)
    }
}
