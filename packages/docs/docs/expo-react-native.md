---
id: expo-react-native
title: Expo and React Native
sidebar_label: expo/react native
---

## Resources





# Setup

- install the expo cli - `yarn global add expo-cli` - https://tinyurl.com/y6j2m7b6
- set up Android Studio - https://tinyurl.com/yyz7csdq (might need to do this also - https://tinyurl.com/y6okwmcl)
- init the project (as a monorepo package) - `cd packages; expo init` - https://tinyurl.com/y4ru8jgy . Update the `package.json` to be in line with what `lerna` would have done for us, including importantly the version
- sign in to the mobile expo app as `matthew.penrice@gmail.com` : (password managed in chrome)
- as of expo 33 it will not run within yarn workspaces. Go through these steps to fix - https://tinyurl.com/yytvctjg
- `yarn start` . The app should be visible within expo android app. 
