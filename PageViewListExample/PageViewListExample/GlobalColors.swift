//
//  GlobalColors.swift
//  PageViewListExample
//
//  Created by Admin on 25/10/21.
//

import Foundation
import UIKit

enum AppColors{
    case color74777B
    case color0072EE
    case color00B5EE
    case colorBABDC1
    case colorBDBDBD
    case color0094FF
    case colorF2F2F2
    case color052D55
    case color303133
    case colorEAEAEA
    case colorF1F1F1
    case colorDADADA
    case colorEA4335
    case colorF9F9F9
}

extension AppColors{
    
    var colorValue: UIColor{
        switch self{
        
        case .color74777B:
            return #colorLiteral(red: 0.4549019608, green: 0.4666666667, blue: 0.4823529412, alpha: 1)
        case .color0072EE:
            return #colorLiteral(red: 0, green: 0.4470588235, blue: 0.9333333333, alpha: 1)
        case .color00B5EE:
            return #colorLiteral(red: 0, green: 0.5384445786, blue: 0.9479792714, alpha: 1)
        case .colorBABDC1:
            return #colorLiteral(red: 0.7294117647, green: 0.7411764706, blue: 0.7568627451, alpha: 1)
        case .colorBDBDBD:
            return #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        case .color0094FF:
            return #colorLiteral(red: 0, green: 0.5803921569, blue: 1, alpha: 1)
        case .colorF2F2F2:
            return #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        case .color052D55:
            return #colorLiteral(red: 0.01960784314, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        case .color303133:
            return #colorLiteral(red: 0.1882352941, green: 0.1921568627, blue: 0.2, alpha: 1)
        case .colorEAEAEA:
            return #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        case .colorF1F1F1:
            return #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        case .colorDADADA:
            return #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        case .colorEA4335:
            return #colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.2078431373, alpha: 1)
        case .colorF9F9F9:
            return #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        }
    }
    
    var hexCode: String{
        switch self{
        
        case .color74777B:
            return "74777B"
        case .color0072EE:
            return "0072EE"
        case .color00B5EE:
            return "00B5EE"
        case .colorBABDC1:
            return "BABDC1"
        case .colorBDBDBD:
            return "BDBDBD"
        case .color0094FF:
            return "0094FF"
        case .colorF2F2F2:
            return "F2F2F2"
        case .color052D55:
            return "052D55"
        case .color303133:
            return "303133"
        case .colorEAEAEA:
            return "EAEAEA"
        case .colorF1F1F1:
            return "F1F1F1"
        case .colorDADADA:
            return "DADADA"
        case .colorEA4335:
            return "EA4335"
        case .colorF9F9F9:
            return "F9F9F9"
        }
    }
}
