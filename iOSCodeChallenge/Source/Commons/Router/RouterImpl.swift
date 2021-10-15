
import Foundation
import UIKit

class RouterImpl: Router
{

    weak var parentVC: UIViewController?

    init(parentVC: UIViewController)
    {
        self.parentVC = parentVC
    }
    
    // MARK: - Home Step
    func navigateToResultDetail(item: IDResultModel)
    {
        let resultDetail = AppModules.createDetail(item: item)
        parentVC?.navigationController?.pushViewController(resultDetail, animated: true)
    }
    
    // MARK: - Assistant
    func goBack()
    {
        if let sceneVC = self.parentVC {
            if isModal(vc: sceneVC) {
                sceneVC.dismiss(animated: true, completion: nil)
            } else {
                sceneVC.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
}

private extension RouterImpl
{

    func isModal(vc: UIViewController) -> Bool
    {
        guard let presentingViewController = vc.presentingViewController else {
            return false
        }
        if presentingViewController.presentedViewController == vc.navigationController || (presentingViewController.isKind(of: UITabBarController.self)) { return true }
        return false
    }
}
