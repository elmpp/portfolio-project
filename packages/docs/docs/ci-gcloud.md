---
id: ci_gcloud
title: Continuous Integration Google Cloud
sidebar_label: CI Google Cloud
---

Check the [documentation](https://docusaurus.io) for how to use Docusaurus.

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

  We will need to run [git subtree splitting](https://goo.gl/9QoIXB) which will sync the monorepo with [individual repos](https://goo.gl/rNfdXx) (for the "splittable" packages as defined in `local.env`). We won't need npm registries now as lerna can understand [dependencies with committishes](https://goo.gl/tttf2w) ~~These will be pushed to our (private?) npm registries and no git tagging will occur~~
- Google Cloud Build will have steps for each package that should be build/containerised. Lerna will dictate whether it needs repackaging or the previous tagged image just promoting
- Cloud Run will deploy the images from Container Registry either continually or via a `gcloud` command from CI




