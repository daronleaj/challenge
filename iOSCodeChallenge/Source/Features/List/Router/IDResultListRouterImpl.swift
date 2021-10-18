
class IDResultListRouterImpl
{

    var mainRouter: Router
    
    init(mainRouter: Router)
    {
        self.mainRouter = mainRouter
    }
}

extension IDResultListRouterImpl: IDResultListRouter
{
    func goToDetail(itemModel: IDResultModel)
    {
        mainRouter.navigateToResultDetail(item: itemModel)
    }
}
