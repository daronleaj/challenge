import Foundation
import UIKit

enum FontName: String
{
    case josefinSan = "JosefinSans"
}

enum FontType: String
{
    case bold = "Bold"
    case light = "Light"
    case regular = "Regular"
    case semibold = "SemiBold"
    case medium = "Medium"
    case italic = "Italic"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
    case lightItalic = "LightItalic"
    case semiboldItalic = "SemiBoldItalic"
    case boldItalic = "BoldItalic"
}

enum FontSize: CGFloat
{
    case teen = 10.0
    case eleven = 11.0
    case twelve = 12.0
    case fourteen = 14.0
    case sixteen = 16.0
    case eighteen = 18.0
    case twenty = 20.0
    case twentyTwo = 22.0
    case twentyfour = 24.0
    case twentysix = 26.0
    case thirty = 30.0
    case thirtytwo = 32.0
}

extension UIFont
{

    class func mainFont(name: FontName, size: FontSize, fontType: FontType) -> UIFont
    {
        let fontSizeScale: CGFloat = 1.0

        let fontSizeScaled = size.rawValue * fontSizeScale

        let fontName: String = name.rawValue
        
        switch name {
        case .josefinSan:
            switch fontType {
            case .bold, .light, .regular, .semibold, .italic, .thin, .thinItalic, .lightItalic, .semiboldItalic, .boldItalic:
                return UIFont(name: "\(fontName)-\(fontType.rawValue)", size: fontSizeScaled)!
            default:
                return UIFont(name: "\(fontName)-\(FontType.regular.rawValue)", size: fontSizeScaled)!
            }
        }
    }
}
