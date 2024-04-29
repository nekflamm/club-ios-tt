//
//  LoggerManager.swift
//  Boilerplate
//
//  Created by Kevin on 25/11/2020.
//

import Foundation

/**
 Swifty beaver implementation of the `LoggerManagerLogic`
 */
class LoggerManager: LoggerManagerLogic {

    // MARK: - Properties

    /** Singleton */
    static let shared: LoggerManager = LoggerManager()

    // MARK: - Initializer

    /** Doing this, we ensure the `LoggerManager` is not instancied from outside */
    private init() {
    }

    // MARK: - Functions

    /** Refers to the `v` function of the `LoggerManagerLogic` */
    func v(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    }

    /** Refers to the `d` function of the `LoggerManagerLogic` */
    func d(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    }

    /** Refers to the `i` function of the `LoggerManagerLogic` */
    func i(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    }

    /** Refers to the `w` function of the `LoggerManagerLogic` */
    func w(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    }

    /** Refers to the `e` function of the `LoggerManagerLogic` */
    func e(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    }
    
    /** Refers to the `record` function of the `LoggerManagerLogic` */
    func record(_ errorMessage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line, extra: String? = nil) {
        e(errorMessage, file, function, line: line)

        var userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: "\(function):\(line)",
            NSLocalizedFailureReasonErrorKey: errorMessage
        ]
        
        if let extra = extra { userInfo["raw"] = extra }
        let file = file.split(separator: "/").last ?? "Unable_to_find_file"
        let error = NSError(domain: String(file), code: -1001, userInfo: userInfo)

        // crashlytics.record(error: error)
    }
}
