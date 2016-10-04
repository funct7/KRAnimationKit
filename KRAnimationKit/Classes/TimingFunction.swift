//
//  TimingFunction.swift
//  Pods
//
//  Created by Joshua Park on 7/2/16.
//
//

public enum FunctionType {
    case linear
    
    case easeInSine
    case easeOutSine
    case easeInOutSine
    
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    
    case easeInBack
    case easeOutBack
    case easeInOutBack
    
    case easeInElastic
    case easeOutElastic
    case easeInOutElastic
    
    case easeInBounce
    case easeOutBounce
    case easeInOutBounce
    
    public func converseFunction() -> FunctionType {
        switch self {
        case .easeInSine: return .easeOutSine
        case .easeOutSine: return .easeInSine
        case .easeInQuad: return .easeOutQuad
        case .easeOutQuad: return .easeInQuad
        case .easeInCubic: return .easeOutCubic
        case .easeOutCubic: return .easeInCubic
        case .easeInQuart: return .easeOutQuart
        case .easeOutQuart: return .easeInQuart
        case .easeInQuint: return .easeOutQuint
        case .easeOutQuint: return .easeInQuint
        case .easeInExpo: return .easeOutExpo
        case .easeOutExpo: return .easeInExpo
        case .easeInCirc: return .easeOutCirc
        case .easeOutCirc: return .easeInCirc
        case .easeInBack: return .easeOutBack
        case .easeOutBack: return .easeInBack
        case .easeInElastic: return .easeOutElastic
        case .easeOutElastic: return .easeInElastic
        case .easeInBounce: return .easeOutBounce
        case .easeOutBounce: return .easeInBounce
        default: return self
        }
    }
}
