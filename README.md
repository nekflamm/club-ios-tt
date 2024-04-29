## Technical iOS Test

Welcome in Club MVP. Content creator enter the app and can create their list of “Content Request”. Content which can be requested by their community such as :
* ”Shoutout video: I’ll send you a video of me mentioning your name, your activity” or
* “Commercial promotion: I’ll test your product and create some content on it.”

The current app is not complete, you land on the “request list” (loading, placeholder and list OK), but the rest is missing.
* Add a new content request.
* Delete an item.
* Edit an item.

As specs / requirements you’ll only count on the Figma file & on the current architecture (and screens). The challenge is to adapt on an existing : codebase, architecture, code processes. Features you are added will be shipped in prod, so everything should be done following this idea.

Technical infos :
* Architecture is based on “clean architecture principles” with UI layer (MVVM) & data layer (Usecases, Workers, Providers).
* We’ve mocked the some part of the UserWorker on purpose to avoid dealing with authentication, tokens etc.
* Following the mocked worker, it's ok to save the data only for the current app lifecycle, kill = back to initial state. 
* UI layer is a MVVM (input/output) + RXSwift architecture (+ RxDatasource).

> Tips:
> look around ++ you’ll find many useful piece of code, files so : help/clue. Also, check logs.
> almost everything has been done on purpose on the project, to help & to guide the developer.

## Figma file
https://www.figma.com/file/wSk8vXwbY9Pw6aTnkgcbNW/iOS-Technical-test-ClubMVP?type=design&node-id=0%3A1&mode=design&t=KgYFXVNg433tLeR5-1

## Launch instructions
Pods folder is already filled on purpose so no need to pod install, you can compile & run. 
If you need any extra lib, it's your choice, we'll let you re-install the pods. 
