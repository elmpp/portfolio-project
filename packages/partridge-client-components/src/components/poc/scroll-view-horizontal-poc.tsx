import React from 'react'
import {Text, ScrollView} from 'react-native'

interface ScrollViewHorizontalPocProps {}
export const ScrollViewHorizontalPoc: React.FC<ScrollViewHorizontalPocProps> = () => {
  return (
    <ScrollView
      horizontal={true}
      // showsVerticalScrollIndicator={false}
      // style={{flexDirection: 'row', flexBasis: 300, width: 300}}
      style={{flex: 1, flexDirection: 'row', flexBasis: 350, width: '100%'}}
      contentContainerStyle={{flexDirection: 'row', alignItems: 'center', backgroundColor: 'green'}}
    >
      {Array(50)
        .fill(0)
        .map((_, index) => (
          <Text key={`text-${index}`}>Bollocks</Text>
        ))}
    </ScrollView>
  )
}
