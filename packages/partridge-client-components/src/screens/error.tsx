import React from 'react'
import {View} from 'react-native'
import {Text} from '../libs/text'
import {logger, DumpableError} from 'partridge-logging'

interface Props {
  // who knows
}

logger.log(
  'error',
  new DumpableError('check for error report sending in browser with dumpable', {testDumpable: [{this: 'that'}]})
)

export const ErrorScreen: React.FC<Props> = () => {
  // throw Error('thrown from within /screens/error.tsx')

  return (
    <View>
      <Text>Check console that </Text>
      <Text>Error page (proving thrown errors are handled)</Text>
    </View>
  )
}
