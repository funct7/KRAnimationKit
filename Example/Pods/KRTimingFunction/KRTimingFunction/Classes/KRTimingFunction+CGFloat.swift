//
//  KRTimingFunction+CGFloat.swift
//  Pods
//
//  Created by Joshua Park on 18/11/2016.
//
//

import Foundation

fileprivate func -= (lhs: inout CGFloat, rhs: CGFloat) -> CGFloat {
    lhs = lhs - rhs
    return lhs
}

fileprivate func *= (lhs: inout CGFloat, rhs: CGFloat) -> CGFloat {
    lhs = lhs * rhs
    return lhs
}

public extension TimingFunction {
    static func value(using function: FunctionType, rt: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat? = nil) -> CGFloat {
        switch function {
        case .linear:           return TimingFunction.linear(rt: rt, b: b, c: c)
            
        case .easeInSine:       return TimingFunction.easeInSine(rt: rt, b: b, c: c)
        case .easeOutSine:      return TimingFunction.easeOutSine(rt: rt, b: b, c: c)
        case .easeInOutSine:    return TimingFunction.easeInOutSine(rt: rt, b: b, c: c)
            
        case .easeInQuad:       return TimingFunction.easeInQuad(rt: rt, b: b, c: c)
        case .easeOutQuad:      return TimingFunction.easeOutQuad(rt: rt, b: b, c: c)
        case .easeInOutQuad:    return TimingFunction.easeInOutQuad(rt: rt, b: b, c: c)
            
        case .easeInCubic:      return TimingFunction.easeInCubic(rt: rt, b: b, c: c)
        case .easeOutCubic:     return TimingFunction.easeOutCubic(rt: rt, b: b, c: c)
        case .easeInOutCubic:   return TimingFunction.easeInOutCubic(rt: rt, b: b, c: c)
            
        case .easeInQuart:      return TimingFunction.easeInQuart(rt: rt, b: b, c: c)
        case .easeOutQuart:     return TimingFunction.easeOutQuart(rt: rt, b: b, c: c)
        case .easeInOutQuart:   return TimingFunction.easeInOutQuart(rt: rt, b: b, c: c)
            
        case .easeInQuint:      return TimingFunction.easeInQuint(rt: rt, b: b, c: c)
        case .easeOutQuint:     return TimingFunction.easeOutQuint(rt: rt, b: b, c: c)
        case .easeInOutQuint:   return TimingFunction.easeInOutQuint(rt: rt, b: b, c: c)
            
        case .easeInExpo:       return TimingFunction.easeInExpo(rt: rt, b: b, c: c)
        case .easeOutExpo:      return TimingFunction.easeOutExpo(rt: rt, b: b, c: c)
        case .easeInOutExpo:    return TimingFunction.easeInOutExpo(rt: rt, b: b, c: c)
            
        case .easeInCirc:       return TimingFunction.easeInCirc(rt: rt, b: b, c: c)
        case .easeOutCirc:      return TimingFunction.easeOutCirc(rt: rt, b: b, c: c)
        case .easeInOutCirc:    return TimingFunction.easeInOutCirc(rt: rt, b: b, c: c)
            
        case .easeInBack:       return TimingFunction.easeInBack(rt: rt, b: b, c: c)
        case .easeOutBack:      return TimingFunction.easeOutBack(rt: rt, b: b, c: c)
        case .easeInOutBack:    return TimingFunction.easeInOutBack(rt: rt, b: b, c: c)
            
        case .easeInElastic:    return TimingFunction.easeInElastic(rt: rt, b: b, c: c, d: d!)
        case .easeOutElastic:   return TimingFunction.easeOutElastic(rt: rt, b: b, c: c, d: d!)
        case .easeInOutElastic: return TimingFunction.easeInOutElastic(rt: rt, b: b, c: c, d: d!)
            
        case .easeInBounce:     return TimingFunction.easeInBounce(rt: rt, b: b, c: c)
        case .easeOutBounce:    return TimingFunction.easeOutBounce(rt: rt, b: b, c: c)
        case .easeInOutBounce:  return TimingFunction.easeInOutBounce(rt: rt, b: b, c: c)
        }
    }
    
    static func linear(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * rt + b
    }
    // Sine
    static func easeInSine(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return -c * cos(rt * (CGFloat.pi/2.0)) + c + b
    }
    static func easeOutSine(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * sin(rt * (CGFloat.pi/2.0)) + b
    }
    static func easeInOutSine(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return -c/2 * (cos(CGFloat.pi*rt) - 1) + b
    }
    // Quad
    static func easeInQuad(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * rt*rt + b
    }
    
    static func easeOutQuad(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return -c * rt*(rt-2) + b
    }
    
    static func easeInOutQuad(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt + b }
        return -c/2 * ((rt-=1.0)*(rt-2) - 1) + b
    }
    
    // Cubic
    static func easeInCubic(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * rt*rt*rt + b
    }
    static func easeOutCubic(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        return c*((rt-=1)*rt*rt + 1) + b
    }
    static func easeInOutCubic(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt*rt + b }
        return c/2 * ((rt-=2)*rt*rt + 2) + b
    }
    // Quart
    static func easeInQuart(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * rt*rt*rt*rt + b
    }
    static func easeOutQuart(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        return -c * ((rt-=1)*rt*rt*rt - 1) + b
    }
    static func easeInOutQuart(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2*rt*rt*rt*rt + b }
        return -c/2 * ((rt-=2)*rt*rt*rt - 2) + b
    }
    // Quint
    static func easeInQuint(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c * rt*rt*rt*rt*rt + b
    }
    static func easeOutQuint(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        return c * ((rt-=1)*rt*rt*rt*rt + 1) + b
    }
    static func easeInOutQuint(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt*rt*rt*rt + b }
        return c/2 * ((rt-=2)*rt*rt*rt*rt + 2) + b
    }
    // Expo
    static func easeInExpo(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return rt == 0.0 ? b : c * pow(2, 10 * (rt - 1)) + b
    }
    static func easeOutExpo(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return rt == 1.0 ? b+c : c * (-pow(2, -10 * rt) + 1) + b
    }
    static func easeInOutExpo(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if (rt*=2.0) < 1 { return c/2 * pow(2, 10 * (rt - 1)) + b }
        return c/2 * (-pow(2, -10 * (rt-=1)) + 2) + b
    }
    // Circ
    static func easeInCirc(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return -c * (sqrt(1 - rt*rt) - 1) + b
    }
    static func easeOutCirc(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        return c * sqrt(1 - (rt-=1)*rt) + b
    }
    static func easeInOutCirc(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if (rt*=2.0) < 1 { return -c/2 * (sqrt(1 - rt*rt) - 1) + b }
        return c/2 * (sqrt(1 - (rt-=2)*rt) + 1) + b
    }
    // Back
    static func easeInBack(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        let s: CGFloat = 1.70158
        return c * rt*rt*((s+1) * rt - s) + b
    }
    static func easeOutBack(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        let rt = rt - 1
        let s: CGFloat = 1.70158
        let ex1 = (s+1) * rt + s
        return c * (rt * rt * ex1 + 1) + b
    }
    static func easeInOutBack(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var (rt, s) = (rt, CGFloat(1.70158) * 1.525)
        if ((rt*=2.0) < 1) {
            let exp = rt*rt*((s+1)*rt - s)
            return c/2 * exp + b
        }
        let exp = (rt-=2)*rt*(((s*=1.525)+1)*rt + s) + 2
        return c/2 * exp + b
    }
    // Elastic
    static func easeInElastic(rt: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat) -> CGFloat {
        var (rt, s, a) = (rt, CGFloat(1.70158), c)
        let p = d * 0.3
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p / 4.0) }
        else          { s = p / (2*CGFloat.pi) * asin(c/a) }
        return -(a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*CGFloat.pi) / p)) + b
    }
    static func easeOutElastic(rt: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat) -> CGFloat {
        var (s, a) = (CGFloat(1.70158), c)
        let p = d * 0.3
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p/4) }
        else          { s = p / (2*CGFloat.pi) * asin(c/a) }
        return a * pow(2,-10 * rt) * sin((rt*d-s) * (2*CGFloat.pi) / p) + c + b
    }
    static func easeInOutElastic(rt: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat) -> CGFloat {
        var rt = rt
        var s = CGFloat(1.70158)
        let p = d * 0.45
        var a = c
        if rt == 0.0 { return b }
        if (rt*=2.0) == 2.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p/4.0) }
        else          { s = p / (2.0*CGFloat.pi) * asin(c/a) }
        if rt < 1 { return -0.5 * (a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*CGFloat.pi) / p)) + b }
        return a * pow(2,-10 * (rt-=1)) * sin((rt*d-s) * (2*CGFloat.pi) / p) * 0.5 + c + b
    }
    // Bounce
    static func easeInBounce(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        return c - TimingFunction.easeOutBounce(rt: 1.0-rt, b: 0, c: c) + b
    }
    static func easeOutBounce(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        var rt = rt
        if rt < 1/2.75 {
            return c * (7.5625*rt*rt) + b
        } else if rt < 2/2.75 {
            return c * (7.5625*(rt-=(1.5/2.75))*rt + 0.75) + b
        } else if rt < 2.5/2.75 {
            return c * (7.5625*(rt-=(2.25/2.75))*rt + 0.9375) + b
        } else {
            return c * (7.5625*(rt-=(2.625/2.75))*rt + 0.984375) + b
        }
    }
    static func easeInOutBounce(rt: CGFloat, b: CGFloat, c: CGFloat) -> CGFloat {
        if rt < 0.5 { return TimingFunction.easeInBounce(rt: rt*2, b: 0, c: c) * 0.5 + b }
        return TimingFunction.easeOutBounce(rt: rt*2 - 1, b: 0, c: c) * 0.5 + c*0.5 + b
    }
}
