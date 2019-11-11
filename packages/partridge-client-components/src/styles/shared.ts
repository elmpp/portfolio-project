import {ViewStyle} from 'react-native'

const createMappedDictionary = <T extends Dictionary<ViewStyle>>(sameTypedObject: T) => sameTypedObject

export const sharedStyle = createMappedDictionary({
  flex: {
    flex: 1,
  },

  flexGrow: {
    flexGrow: 1,
  },

  flexWrap: {
    flexWrap: 'wrap',
  },

  center: {
    alignContent: 'center',
    alignItems: 'center',
    justifyContent: 'center',
  },

  horizontal: {
    flexDirection: 'row',
    alignItems: 'stretch',
  },

  vertical: {
    flexDirection: 'column',
    alignItems: 'stretch',
  },

  verticalCenter: {
    flexDirection: 'column',
    alignItems: 'stretch',
    justifyContent: 'center',
  },

  horizontalAndVerticallyAligned: {
    flexDirection: 'row',
    alignContent: 'center',
    alignItems: 'center',
  },

  muted: {
    opacity: 0.6,
  },

  activeSurface: {
    elevation: 6, // RNP elevation code - https://tinyurl.com/y642ykos
  },

  widthByChild: {
    alignSelf: 'flex-start', // SO - https://tinyurl.com/y5va9uze
  },

  interactionPrompt: {},

  redline: {
    borderWidth: 1,
    borderStyle: 'dashed',
    borderColor: 'red',
  },
  backgroundFill: {
    backgroundColor: 'blue',
  },
})
