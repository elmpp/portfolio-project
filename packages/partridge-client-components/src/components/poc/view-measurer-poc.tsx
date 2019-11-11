import React from 'react'
import {StyleSheet, View, Text, ScrollView} from 'react-native'
import {ViewMeasurer} from '../../render-prop/view-measurer'

const estimatedWidth = 300
const estimatedHeight = 300

const styles = StyleSheet.create({
  container: {
    // width: 500,
    width: estimatedWidth,
    // height: 200,
    height: '100%',
    backgroundColor: 'pink',
    // flex: 1,
  },
  innerContainer: {
    backgroundColor: 'pink',
    // height: 200,
  },
  items: {
    height: 300,
  },
})

interface ViewMeasurerPocProps {}
export const ViewMeasurerPoc: React.FC<ViewMeasurerPocProps> = () => {
  return (
    // <View style={styles.container}>
    <ViewMeasurer
      initialResult={{width: estimatedWidth, height: estimatedHeight}}
      mapper={a => a}
      style={{}}
      // style={{flex: 1}}
    >
      {({width, height}) => (
        <ScrollView
          horizontal={true}
          showsVerticalScrollIndicator={false}
          style={{flexGrow: 1}}
          contentContainerStyle={{flex: 1}}
        >
          <View style={[{flexDirection: 'row'}, styles.innerContainer]}>
            <View style={[{flexGrow: 1}, styles.items]}>
              <Text>Width: {width}</Text>
            </View>
            <View style={[{flexGrow: 6}, styles.items]}>
              <Text>Height: {height}</Text>
            </View>
          </View>
        </ScrollView>
      )}
      {/* {({width, height}) => (<View style={styles.innerContainer}>
            <View style={styles.items}><Text>Width: {width}</Text></View>
            <View style={styles.items}><Text>Height: {height}</Text></View>
          </View>)} */}
    </ViewMeasurer>
    // </View>
  )
}
