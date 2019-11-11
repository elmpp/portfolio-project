import {Platform as _Platform} from 'react-native'

import {PlatformSelectSpecifics, PlatformSelectOptions} from './index.shared'

export const Platform = {
  ..._Platform,
  isElectron: false,
  isStandalone: true,
  realOS: _Platform.OS,
  selectUsingRealOS<T>(specifics: PlatformSelectSpecifics<T>, _options?: PlatformSelectOptions) {
    return _Platform.select(specifics)
  },
}
