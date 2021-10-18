import UIKit

final class IDResultListPresenterImpl
{
    
    //MARK: - View
    var view: IDResultListView?
    
    //MARK: - Interactor
    var interactor: IDResultListInteractor?
    var interactorSpace: IDSpaceInteractor?
    
    //MARK: - Router
    var router: IDResultListRouter?
}

// MARK: - Presenter methods
extension IDResultListPresenterImpl: IDResultListPresenter
{
    
    func viewDidLoad()
    {
        //Nothing to do here
    }
    
    func viewWillAppear()
    {
        AnalyticsAgent.SpaceScreen.trackListSpace()
        
        interactor?.fetchListSpaces()
    }
    
    func viewDidAppear()
    {
        //Nothing to do here
    }
    
    func userWantPullRefreshTable()
    {
        interactor?.fetchListSpaces()
    }
    
    func userClick(itemModel: IDResultModel)
    {
        AnalyticsAgent.SpaceEvent.selectSpace(code: itemModel.code ?? "")
        
        router?.goToDetail(itemModel: itemModel)
    }
    
    func userClickAddFavorite(itemModel: IDResultModel)
    {
        AnalyticsAgent.SpaceEvent.addSpace(code: itemModel.code ?? "")
        
        interactorSpace?.addSpaceFavorie(item: itemModel)
    }
    
    func userClickRemoveFavorite(itemModel: IDResultModel)
    {
        AnalyticsAgent.SpaceEvent.removeSpace(code: itemModel.code ?? "")
        
        interactorSpace?.removeSpaceFavorie(item: itemModel)
    }
}

// MARK: - IDResultListInteractorCallback methods
extension IDResultListPresenterImpl: IDResultListInteractorCallback
{
    func fetchedListSpaces(result: Result<[IDResultModel], IDResultListInteractorError>)
    {
        switch result {
        case .success(let elementList):
            DispatchQueue.main.async {
                self.view?.showListSpaces(spaces: elementList)
            }
        case .failure(_ ):
            DispatchQueue.main.async {
                self.view?.showListSpaces(spaces: [])
            }
        }
    }
}

// MARK: - IDSpaceInteractorCallback methods
extension IDResultListPresenterImpl: IDSpaceInteractorCallback
{
}
