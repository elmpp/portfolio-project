# `CI`

> outlines the strategy towards CD through CI


## Resources
 - `lerna version` - https://goo.gl/rVsdWy


## Approach (develop branch)

This branch is not a release branch so will have a much simpler workflow:

 - kicked off upon each commit
 - runs unit, lint and functional tests only


## Approach (release branches)

This is a more rigorous process as the changes here must be tested in an E2E setting. If passing, this is considered a releasable version of the app.

 - kicked off upon new feature branches and commits thereto. As we are using [git flow](https://goo.gl/Cby1Nw), release branches will be named `/release/xxx` (@see `allowBranch` of `lerna.json`)
 - unit, lint and functional tests ran.
 - [lerna version prepatch/preminor/premajor](https://goo.gl/XHgD5H) will update versions of projects that have changes and give a version similar to `3.0.1-beta.0`.
We will need to run [git subtree splitting](https://goo.gl/9QoIXB) which will sync the monorepo with [individual repos](https://goo.gl/rNfdXx). We won't need npm registries now as lerna can understand [dependencies with committishes](https://goo.gl/tttf2w) ~~These will be pushed to our (private?) npm registries and no git tagging will occur~~
 - We will then build docker images based on which projects says [have changed](https://goo.gl/c2f737). The images will simply do an `npm install@CANARY_VERSION` and will be pulled from the (private) repo. Its dependencies should have been updated correctly by lerna in previous step. This command should be done in an `run` step of `docker build`. These images should be tagged with this canary version and __not__ @latest. We'll have to build __all releasable images__
 - we will scale up the nodepool size if required (could be 0 if "powered off")
 - We will locally update the helm charts to include these new versions and push to k8s (with the `staging` namespace)
 - Perhaps we should force-deploy(?) a "migrations/db" deployable that will do the necessary db changes either forwards or backwards. In this staging env though it should always load some fixtures
 - The CI should then execute our E2E tests against this staging environment
 - If it passes:
   -  we should then run `lerna version minor`. This will have the effect of making the canary release [graduate](https://goo.gl/dzVgE7)
   - update helm charts to these new release versions. `git add and commit` the helm chart changes
   - Then we can run [lerna publish](https://goo.gl/Ah5W1g) which will create our git tag as well as pushing the release versions of the packages to the repo
   - run the [git subtree splitting](https://goo.gl/9QoIXB) again
   - build all images again with new release version. This should be __all releasable images__
   - finally if all succeeds, we can merge into master. Tbd whether this kicks of a "live release" shippable job or not
   - run the [git subtree splitting](https://goo.gl/9QoIXB) finally but this time against the master branch for all projects
- it it fails:
   - perhaps roll back the staging release to a previous "good" helm release (this will be a non-canary named version number)


This branch is not a release branch so will have a much simpler workflow:

 - runs unit, lint and functional tests only


```
const shell = require('shell');

// TODO: DEMONSTRATE API
```
