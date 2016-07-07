//
//  TimingFunction.swift
//  Pods
//
//  Created by Joshua Park on 7/2/16.
//
//

public enum FunctionType {
    case Linear
    
    case EaseInSine
    case EaseOutSine
    case EaseInOutSine
    
    case EaseInQuad
    case EaseOutQuad
    case EaseInOutQuad
    
    case EaseInCubic
    case EaseOutCubic
    case EaseInOutCubic
    
    case EaseInQuart
    case EaseOutQuart
    case EaseInOutQuart
    
    case EaseInQuint
    case EaseOutQuint
    case EaseInOutQuint
    
    case EaseInExpo
    case EaseOutExpo
    case EaseInOutExpo
    
    case EaseInCirc
    case EaseOutCirc
    case EaseInOutCirc
    
    case EaseInBack
    case EaseOutBack
    case EaseInOutBack
    
    case EaseInElastic
    case EaseOutElastic
    case EaseInOutElastic
    
    case EaseInBounce
    case EaseOutBounce
    case EaseInOutBounce
    
    public func converseFunction() -> FunctionType {
        switch self {
        case .EaseInSine: return .EaseOutSine
        case .EaseOutSine: return .EaseInSine
        case .EaseInQuad: return .EaseOutQuad
        case .EaseOutQuad: return .EaseInQuad
        case .EaseInCubic: return .EaseOutCubic
        case .EaseOutCubic: return .EaseInCubic
        case .EaseInQuart: return .EaseOutQuart
        case .EaseOutQuart: return .EaseInQuart
        case .EaseInQuint: return .EaseOutQuint
        case .EaseOutQuint: return .EaseInQuint
        case .EaseInExpo: return .EaseOutExpo
        case .EaseOutExpo: return .EaseInExpo
        case .EaseInCirc: return .EaseOutCirc
        case .EaseOutCirc: return .EaseInCirc
        case .EaseInBack: return .EaseOutBack
        case .EaseOutBack: return .EaseInBack
        case .EaseInElastic: return .EaseOutElastic
        case .EaseOutElastic: return .EaseInElastic
        case .EaseInBounce: return .EaseOutBounce
        case .EaseOutBounce: return .EaseInBounce
        default: return self
        }
    }
}
