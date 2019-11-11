import React from 'react'
import {View, Platform, StyleSheet} from 'react-native'
import {Colors, Appbar, FAB, Switch, Paragraph, withTheme} from 'react-native-paper'
// import('process')
// require('node-libs-react-native/globals')

const initialParams = {
  showLeftIcon: true,
  showSubtitle: true,
  showSearchIcon: true,
  showMoreIcon: true,
}

// console.log('process-test-hero :', process);

const MORE_ICON = Platform.OS === 'ios' ? 'more-horiz' : 'more-vert'

class AppbarExample extends React.Component<any> {
  static title = 'Appbar'
  // static navigationOptions = ({ navigation }: any) => {
  //   const params = { ...initialParams, ...navigation.state.params };

  //   return {
  //     header: (
  //       <Appbar.Header>
  //         {params.showLeftIcon && (
  //           <Appbar.BackAction onPress={() => navigation.goBack()} />
  //         )}
  //         <Appbar.Content
  //           title="Title"
  //           subtitle={params.showSubtitle ? 'Subtitle' : null}
  //         />
  //         {params.showSearchIcon && (
  //           <Appbar.Action icon="search" onPress={() => {}} />
  //         )}
  //         {params.showMoreIcon && (
  //           <Appbar.Action icon={MORE_ICON} onPress={() => {}} />
  //         )}
  //       </Appbar.Header>
  //     ),
  //   };
  // };

  render() {
    const {
      theme: {
        colors: {background},
      },
    } = this.props
    const params = {...initialParams}

    return (
      <View
        style={[
          styles.container,
          {
            // backgroundColor: background,
          },
        ]}
      >
        <View style={styles.row}>
          <Paragraph>Left icon</Paragraph>
          <Switch
            value={params.showLeftIcon}
            // onValueChange={value =>
            //   navigation.setParams({
            //     showLeftIcon: value,
            //   })
            // }
            onValueChange={() => {}}
          />
        </View>
        <View style={styles.row}>
          <Paragraph>Subtitle</Paragraph>
          <Switch
            value={params.showSubtitle}
            // onValueChange={value =>
            //   navigation.setParams({
            //     showSubtitle: value,
            //   })
            // }
            onValueChange={() => {}}
          />
        </View>
        <View style={styles.row}>
          <Paragraph>Search icon</Paragraph>
          <Switch
            value={params.showSearchIcon}
            // onValueChange={value =>
            //   navigation.setParams({
            //     showSearchIcon: value,
            //   })
            // }
          />
        </View>
        <View style={styles.row}>
          <Paragraph>More icon</Paragraph>
          <Switch
            value={params.showMoreIcon}
            // onValueChange={value =>
            //   navigation.setParams({
            //     showMoreIcon: value,
            //   })
            // }
          />
        </View>
        <Appbar style={styles.bottom}>
          <Appbar.Action icon="archive" onPress={() => {}} />
          <Appbar.Action icon="folder" onPress={() => {}} />
          <Appbar.Action icon="label" onPress={() => {}} />
          <Appbar.Action icon="delete" onPress={() => {}} />
        </Appbar>
        <FAB icon="reply" onPress={() => {}} style={styles.fab} />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.pink800,
    paddingVertical: 8,
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 8,
    paddingHorizontal: 16,
  },
  bottom: {
    position: 'absolute',
    left: 0,
    right: 0,
    bottom: 0,
  },
  fab: {
    position: 'absolute',
    right: 16,
    bottom: 28,
  },
})

export const TestHero = withTheme(AppbarExample)
