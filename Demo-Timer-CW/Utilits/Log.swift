//
//  Log.swift
//  iosApp
//
//  Created by yhw on 2020/12/21.
//

import Foundation

enum LogLevel {
    case VERBOSE
    case DEBUG
    case INFO
    case WARN
    case ERROR
}

class Log {
    static func v(
        _ message: Any,
        fileName: String = #file,
        functionName: String = #function,
        line: Int = #line
    ) {
        print(message, level: .VERBOSE, fileName: fileName, functionName: functionName, line: line)
    }
    
    static func d(
        _ message: Any,
        fileName: String = #file,
        functionName: String = #function,
        line: Int = #line
    ) {
        print(message, level: .DEBUG, fileName: fileName, functionName: functionName, line: line)
    }
    
    static func i(
        _ message: Any,
        fileName: String = #file,
        functionName: String = #function,
        line: Int = #line
    ) {
        print(message, level: .INFO, fileName: fileName, functionName: functionName, line: line)
    }
    
    static func w(
        _ message: Any,
        fileName: String = #file,
        functionName: String = #function,
        line: Int = #line
    ) {
        print(message, level: .WARN, fileName: fileName, functionName: functionName, line: line)
    }
    
    static func e(
        _ message: Any,
        fileName: String = #file,
        functionName: String = #function,
        line: Int = #line
    ) {
        print(message, level: .ERROR, fileName: fileName, functionName: functionName, line: line)
    }
    
    private static func getDateTime(format: String = "YYYY-`MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
    
    private static func print(_ message: Any, level: LogLevel, fileName: String, functionName: String, line: Int) {
        var levelString = ""
        switch level {
            case .VERBOSE:
                levelString = "🟢VERBOSE"
            case .DEBUG:
                levelString = "🟡DEBUG"
            case .INFO:
                levelString = "🔵INFO"
            case .WARN:
                levelString = "🟠WARN"
            case .ERROR:
                levelString = "🔴ERROR"
        }
        let message = "\(message) [\(URL(fileURLWithPath: fileName).lastPathComponent.replacingOccurrences(of: ".swift", with: "")).\(functionName)(\(line))]"
        Swift.print("\(levelString): \(message)")
//        switch level {
//            case .VERBOSE, .DEBUG, .INFO:
//                Logger().i(msg: message)
//            case .WARN:
//                Logger().w(msg: message)
//            case .ERROR:
//                Logger().e(msg: message)
//        }
    }
}
