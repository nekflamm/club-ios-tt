//
//  LoggerManagerLogic.swift
//  Boilerplate
//
//  Created by Kevin on 25/11/2020.
//

import Foundation

protocol LoggerManagerLogic {

    /**
     Log into verbose
     - parameter message: The log message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     - parameter context: An optional context
     */
    func v(_ message: Any, _ file: String, _ function: String, line: Int, context: Any?)

    /**
     Log into debug
     - parameter message: The log message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     - parameter context: An optional context
     */
    func d(_ message: Any, _ file: String, _ function: String, line: Int, context: Any?)

    /**
     Log into info
     - parameter message: The log message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     - parameter context: An optional context
     */
    func i(_ message: Any, _ file: String, _ function: String, line: Int, context: Any?)

    /**
     Log into warning
     - parameter message: The log message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     - parameter context: An optional context
     */
    func w(_ message: Any, _ file: String, _ function: String, line: Int, context: Any?)

    /**
     Log into error
     - parameter message: The log message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     - parameter context: An optional context
     */
    func e(_ message: Any, _ file: String, _ function: String, line: Int, context: Any?)
    
    /**
     Record an error to send to Crashlytics.
     - parameter message: The error message
     - parameter file: The caller's file
     - parameter function: The caller's function
     - parameter line: The caller's line
     */
    func record(_ errorMessage: String, _ file: String, _ function: String, _ line: Int, extra: String?)
}
