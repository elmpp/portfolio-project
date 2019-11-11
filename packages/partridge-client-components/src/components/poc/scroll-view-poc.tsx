import React from 'react'
import {Text, ScrollView} from 'react-native'

interface ScrollViewPocProps {}
export const ScrollViewPoc: React.FC<ScrollViewPocProps> = () => {
  return (
    <ScrollView
      // horizontal={true}
      // showsVerticalScrollIndicator={false}
      style={{flexDirection: 'column', flexBasis: 300, width: '100%'}}
      contentContainerStyle={{flexGrow: 1, flexDirection: 'column', alignItems: 'center'}}
    >
      {Array(50)
        .fill(0)
        .map((_, index) => (
          <Text key={`text-${index}`}>Bollocks</Text>
        ))}
    </ScrollView>
  )
}
