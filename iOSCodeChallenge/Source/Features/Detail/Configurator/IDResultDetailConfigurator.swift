import UIKit

final class IDResultDetailConfigurator: NSObject
{
    
    static func createModule(item: IDResultModel) -> UIViewController
    {
        let view = IDResultDetailViewController()
        configureViewController(view, item: item)
        return view
    }
    
    static func configureViewController(_ view: IDResultDetailViewController, item: IDResultModel)
    {
        let presenter = IDResultDetailPresenterImpl(item: item)
        let interactor = IDResultDetailInteractorImpl()
        let interactorSpace = IDSpaceInteractorImpl(session: SessionDataManagerImpl.shared)
        let router = IDResultDetailRouterImpl(mainRouter: RouterImpl(parentVC: view))
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.interactorSpace = interactorSpace
        presenter.router = router
        interactor.presenter = presenter
    }
    
}
