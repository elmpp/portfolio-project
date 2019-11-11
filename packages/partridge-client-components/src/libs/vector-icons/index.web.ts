/**
 * Really cool way of bootstrapping the icon fonts on web
 *
 *  - devhub production - https://tinyurl.com/y3o9zzqj
 */

import MaterialIcons from 'react-native-vector-icons/dist/MaterialCommunityIcons'
import MaterialIconFont from 'react-native-vector-icons/Fonts/MaterialCommunityIcons.ttf' // vscode doesn't resolve ttf

export { MaterialIcons as VectorIcons }

const iconStyles = [
  `@font-face { src:url(${MaterialIconFont});font-family: MaterialIcons; }`,
].join('\n')

const style = document.createElement('style')
style.type = 'text/css'

if ((style as any).styleSheet) {
  ;(style as any).styleSheet.cssText = iconStyles
} else {
  style.appendChild(document.createTextNode(iconStyles))
}

if (document.head) document.head.appendChild(style)
