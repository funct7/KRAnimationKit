//
//  KRTimingFunction.swift
//  Pods
//
//  Created by Joshua Park on 6/15/16.
//
//

import Foundation

fileprivate func -= (lhs: inout Double, rhs: Double) -> Double {
    lhs = lhs - rhs
    return lhs
}

fileprivate func *= (lhs: inout Double, rhs: Double) -> Double {
    lhs = lhs * rhs
    return lhs
}

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
    
    public var inverse: FunctionType {
        switch self {
        case .easeInSine:     return .easeOutSine
        case .easeOutSine:    return .easeInSine
        case .easeInQuad:     return .easeOutQuad
        case .easeOutQuad:    return .easeInQuad
        case .easeInCubic:    return .easeOutCubic
        case .easeOutCubic:   return .easeInCubic
        case .easeInQuart:    return .easeOutQuart
        case .easeOutQuart:   return .easeInQuart
        case .easeInQuint:    return .easeOutQuint
        case .easeOutQuint:   return .easeInQuint
        case .easeInExpo:     return .easeOutExpo
        case .easeOutExpo:    return .easeInExpo
        case .easeInCirc:     return .easeOutCirc
        case .easeOutCirc:    return .easeInCirc
        case .easeInBack:     return .easeOutBack
        case .easeOutBack:    return .easeInBack
        case .easeInElastic:  return .easeOutElastic
        case .easeOutElastic: return .easeInElastic
        case .easeInBounce:   return .easeOutBounce
        case .easeOutBounce:  return .easeInBounce
        default: return self
        }
    }
}


public enum TimingFunction {
    public static func value(using function: FunctionType, rt: Double, b: Double, c: Double, d: Double? = nil) -> Double {
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
    
    public static func linear(rt: Double, b: Double, c: Double) -> Double {
        return c * rt + b
    }
    // Sine
    public static func easeInSine(rt: Double, b: Double, c: Double) -> Double {
        return -c * cos(rt * (Double.pi/2.0)) + c + b
    }
    public static func easeOutSine(rt: Double, b: Double, c: Double) -> Double {
        return c * sin(rt * (Double.pi/2.0)) + b
    }
    public static func easeInOutSine(rt: Double, b: Double, c: Double) -> Double {
        return -c/2 * (cos(Double.pi*rt) - 1) + b
    }
    // Quad
    public static func easeInQuad(rt: Double, b: Double, c: Double) -> Double {
        return c * rt*rt + b
    }
    
    public static func easeOutQuad(rt: Double, b: Double, c: Double) -> Double {
        return -c * rt*(rt-2) + b
    }
    
    public static func easeInOutQuad(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt + b }
        return -c/2 * ((rt-=1.0)*(rt-2) - 1) + b
    }
    
    // Cubic
    public static func easeInCubic(rt: Double, b: Double, c: Double) -> Double {
        return c * rt*rt*rt + b
    }
    public static func easeOutCubic(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        return c*((rt-=1)*rt*rt + 1) + b
    }
    public static func easeInOutCubic(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt*rt + b }
        return c/2 * ((rt-=2)*rt*rt + 2) + b
    }
    // Quart
    public static func easeInQuart(rt: Double, b: Double, c: Double) -> Double {
        return c * rt*rt*rt*rt + b
    }
    public static func easeOutQuart(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        return -c * ((rt-=1)*rt*rt*rt - 1) + b
    }
    public static func easeInOutQuart(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2*rt*rt*rt*rt + b }
        return -c/2 * ((rt-=2)*rt*rt*rt - 2) + b
    }
    // Quint
    public static func easeInQuint(rt: Double, b: Double, c: Double) -> Double {
        return c * rt*rt*rt*rt*rt + b
    }
    public static func easeOutQuint(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        return c * ((rt-=1)*rt*rt*rt*rt + 1) + b
    }
    public static func easeInOutQuint(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if (rt*=2.0) < 1 { return c/2 * rt*rt*rt*rt*rt + b }
        return c/2 * ((rt-=2)*rt*rt*rt*rt + 2) + b
    }
    // Expo
    public static func easeInExpo(rt: Double, b: Double, c: Double) -> Double {
        return rt == 0.0 ? b : c * pow(2, 10 * (rt - 1)) + b
    }
    public static func easeOutExpo(rt: Double, b: Double, c: Double) -> Double {
        return rt == 1.0 ? b+c : c * (-pow(2, -10 * rt) + 1) + b
    }
    public static func easeInOutExpo(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if (rt*=2.0) < 1 { return c/2 * pow(2, 10 * (rt - 1)) + b }
        return c/2 * (-pow(2, -10 * (rt-=1)) + 2) + b
    }
    // Circ
    public static func easeInCirc(rt: Double, b: Double, c: Double) -> Double {
        return -c * (sqrt(1 - rt*rt) - 1) + b
    }
    public static func easeOutCirc(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        return c * sqrt(1 - (rt-=1)*rt) + b
    }
    public static func easeInOutCirc(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        if (rt*=2.0) < 1 { return -c/2 * (sqrt(1 - rt*rt) - 1) + b }
        return c/2 * (sqrt(1 - (rt-=2)*rt) + 1) + b
    }
    // Back
    public static func easeInBack(rt: Double, b: Double, c: Double) -> Double {
        let s = 1.70158
        return c * rt*rt*((s+1) * rt - s) + b
    }
    public static func easeOutBack(rt: Double, b: Double, c: Double) -> Double {
        let rt = rt - 1
        let s = 1.70158
        let ex1 = (s+1) * rt + s
        return c * (rt * rt * ex1 + 1) + b
    }
    public static func easeInOutBack(rt: Double, b: Double, c: Double) -> Double {
        var rt = rt
        var s = 1.70158 * 1.525
        if ((rt*=2.0) < 1) { return c/2 * (rt*rt*((s+1)*rt - s)) + b }
        return c/2 * ((rt-=2)*rt*(((s*=1.525)+1)*rt + s) + 2) + b
    }
    // Elastic
    public static func easeInElastic(rt: Double, b: Double, c: Double, d: Double) -> Double {
        var rt = rt
        var s = 1.70158
        let p = d * 0.3
        var a = c
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p / 4.0) }
        else          { s = p / (2*Double.pi) * asin(c/a) }
        return -(a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p)) + b
    }
    public static func easeOutElastic(rt: Double, b: Double, c: Double, d: Double) -> Double {
        var s = 1.70158
        let p = d * 0.3
        var a = c
        if rt == 0.0 { return b }
        if rt == 1.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p/4) }
        else          { s = p / (2*Double.pi) * asin(c/a) }
        return a * pow(2,-10 * rt) * sin((rt*d-s) * (2*Double.pi) / p) + c + b
    }
    public static func easeInOutElastic(rt: Double, b: Double, c: Double, d: Double) -> Double {
        var rt = rt
        var s = 1.70158
        let p = d * 0.45
        var a = c
        if rt == 0.0 { return b }
        if (rt*=2.0) == 2.0 { return b+c }
        if a < abs(c) { (a, s) = (c, p/4) }
        else          { s = p / (2*Double.pi) * asin(c/a) }
        if rt < 1 { return -0.5 * (a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p)) + b }
        return a * pow(2,-10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p) * 0.5 + c + b
    }
    // Bounce
    public static func easeInBounce(rt: Double, b: Double, c: Double) -> Double {
        return c - TimingFunction.easeOutBounce(rt: 1.0-rt, b: 0, c: c) + b
    }
    public static func easeOutBounce(rt: Double, b: Double, c: Double) -> Double {
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
    public static func easeInOutBounce(rt: Double, b: Double, c: Double) -> Double {
        if rt < 0.5 { return TimingFunction.easeInBounce(rt: rt*2, b: 0, c: c) * 0.5 + b }
        return TimingFunction.easeOutBounce(rt: rt*2 - 1, b: 0, c: c) * 0.5 + c*0.5 + b
    }
}

/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * TERMS OF USE - jQuery Easing
 *
 * Open source under the BSD License.
 *
 * Copyright Â© 2008 George McGinley Smith
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES LOSS OF USE, DATA, OR PROFITS OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
