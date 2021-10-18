import UIKit

extension UIView
{
    func roundCorners(cornerRadius: CGFloat)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
