import React from 'react'
import {StyleSheet, View} from 'react-native'
import {Text} from '../../libs/text'
import {TestHero} from '../../test-hero'
import {SafeAreaView} from '../../libs/safe-area-view'
import {logger} from 'partridge-logging'
import {config} from 'partridge-config'
import {Menu} from '../../components/menu'

logger.log('warn', 'inside /screens/home.tsx innit')
logger.log('warn', 'config dump inside home screen small', {dumpables: {config: [config]}})

interface Props {
  // who knows
}

export const HomeScreen: React.FC<Props> = () => {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.homeHeader}>
        <Text style={styles.h2}>Welcome to After.js</Text>
      </View>
      <View style={styles.homeIntro}>
        <Text>To get started, edit src/Home.js or src/About.js and save to reload.</Text>
      </View>
      <Menu />
      <TestHero />
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  homeHeader: {},
  homeIntro: {},
  h2: {}, // abstract into component
})
