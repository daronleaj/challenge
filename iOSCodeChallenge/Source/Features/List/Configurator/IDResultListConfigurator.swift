import UIKit

final class IDResultListConfigurator: NSObject
{
    
    static func createModule() -> UIViewController
    {
        let view = IDResultListTableViewController()
        configureViewController(view)
        return view
    }
    
    static func configureViewController(_ view: IDResultListTableViewController)
    {
        let presenter = IDResultListPresenterImpl()
        let interactor = IDResultListInteractorImpl(session: SessionDataManagerImpl.shared)
        let interactorSpace = IDSpaceInteractorImpl(session: SessionDataManagerImpl.shared)
        let router = IDResultListRouterImpl(mainRouter: RouterImpl(parentVC: view))
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.interactorSpace = interactorSpace
        presenter.router = router
        interactor.presenter = presenter
    }
    
}
