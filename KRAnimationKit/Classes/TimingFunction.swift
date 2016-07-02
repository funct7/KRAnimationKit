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
    
    public mutating func converseFunction() {
        switch self {
        case .EaseInSine: self = .EaseOutSine
        case .EaseOutSine: self = .EaseInSine
        case .EaseInQuad: self = .EaseOutQuad
        case .EaseOutQuad: self = .EaseInQuad
        case .EaseInCubic: self = .EaseOutCubic
        case .EaseOutCubic: self = .EaseInCubic
        case .EaseInQuart: self = .EaseOutQuart
        case .EaseOutQuart: self = .EaseInQuart
        case .EaseInQuint: self = .EaseOutQuint
        case .EaseOutQuint: self = .EaseInQuint
        case .EaseInExpo: self = .EaseOutExpo
        case .EaseOutExpo: self = .EaseInExpo
        case .EaseInCirc: self = .EaseOutCirc
        case .EaseOutCirc: self = .EaseInCirc
        case .EaseInBack: self = .EaseOutBack
        case .EaseOutBack: self = .EaseInBack
        case .EaseInElastic: self = .EaseOutElastic
        case .EaseOutElastic: self = .EaseInElastic
        case .EaseInBounce: self = .EaseOutBounce
        case .EaseOutBounce: self = .EaseInBounce
        default: break
        }
    }
}
