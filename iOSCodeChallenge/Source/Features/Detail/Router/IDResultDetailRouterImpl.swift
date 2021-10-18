
class IDResultDetailRouterImpl
{

    var mainRouter: Router
    
    init(mainRouter: Router)
    {
        self.mainRouter = mainRouter
    }
}

extension IDResultDetailRouterImpl: IDResultDetailRouter
{
        
    func goBack()
    {
        self.mainRouter.goBack()
    }
}
