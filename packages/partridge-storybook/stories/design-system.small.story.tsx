/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React, {useState, useCallback} from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {Components} from 'partridge-client-components'
import {FeedSupplierName} from 'partridge-config'
import { Text } from 'react-native'

const storiesDef = storiesOf('Design System', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('Icon Stack', () => (
    <Components.IconStack>
      <Components.BookieLogo mode="circle" name={FeedSupplierName.coral} />
      <Components.BookieLogo mode="circle" name={FeedSupplierName.sky} />
      <Components.BookieLogo mode="circle" name={FeedSupplierName.coral} />
      <Components.BookieLogo mode="circle" name={FeedSupplierName.sky} />
      <Components.BookieLogo mode="circle" name={FeedSupplierName.coral} />
      <Components.BookieLogo mode="circle" name={FeedSupplierName.sky} />
    </Components.IconStack>
  ))

  .add('Base Button', () => (
    <VerticalSpace>
      <Components.Button>Something</Components.Button>
      <Components.Button disabled>Disabled</Components.Button>
      <Components.Button transparent>Transparent</Components.Button>
      <Components.Button round>Round</Components.Button>
      <Components.Button loading>Loading</Components.Button>
      <Components.Button color="green">Loading</Components.Button>
      <Components.Button showBorder>Border</Components.Button>
      <Components.Button
        onPress={() => {
          console.log('fucker')
        }}
      >
        Pressable
      </Components.Button>
    </VerticalSpace>
  ))
  .add('Styled/Base Button', () => (
    <VerticalSpace>
      <Components.StyledButton bg='primary'>
        Something
      </Components.StyledButton>
    </VerticalSpace>
  ))
  .add('Progress bar', () => (
    <VerticalSpace>
      <Components.ProgressBar color="green" />
      <Components.ProgressBar progress={80} />
    </VerticalSpace>
  ))
  .add('Icons', () => (
    <VerticalSpace>
      <Components.Icon name="folder" />
      <Components.Icon name="magnify" />
      <Components.Icon name="magnify-minus" />
    </VerticalSpace>
  ))
  .add('Text Input', () => (
      <Components.TextInput textInputKey="search-bar-text-input-key" />
  ))
  .add('Accordion', () => {
    return <AccordionStory />
  })
  .add('Expansion', () => {
    return <ExpansionPanelStory />
  })
  // .add('Search Bar', () => <Components.SearchBar placeholder="Match, Team, Event..." />)

const AccordionStory = React.memo((props: any) => {
  const [isOpen, setIsOpen] = useState(false)
  const pressHandler = useCallback(() => {
    setIsOpen(isOpen => !isOpen)
  }, [isOpen])

  return (
    <VerticalSpace>
      <Components.Button onPress={pressHandler}>Press</Components.Button>
      <Components.AccordionView isOpen={isOpen}>
        <Image
          style={{height: 200, width: 300}}
          source={{
            uri:
              'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          }}
        />
      </Components.AccordionView>
      <Components.AccordionView isOpen={isOpen} plane="width">
        <Image
          style={{height: 200, width: 300}}
          source={{
            uri:
              'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          }}
        />
      </Components.AccordionView>
    </VerticalSpace>
  )
})

const ExpansionPanelStory = React.memo((props: any) => {
  const [isOpen, setIsOpen] = useState(false)
  const pressHandler = useCallback(() => {
    setIsOpen(isOpen => !isOpen)
  }, [isOpen])

  return (
    <View
      style={{
        height: 500,
        width: '100%',
        flexDirection: 'column',
        justifyContent: 'space-between',
        alignItems: 'center',
        alignContent: 'center',
      }}
    >
      <Components.Button onPress={pressHandler}>Press</Components.Button>
      <Components.ExpansionPanel isOpen={isOpen} plane="height" closedSize={100}>
        <Image
          style={{height: 200, width: 300}}
          source={{
            uri:
              'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          }}
        />
      </Components.ExpansionPanel>
      <Components.ExpansionPanel isOpen={isOpen} plane="width" closedSize={100}>
        <Image
          style={{height: 200, width: 300}}
          source={{
            uri:
              'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          }}
        />
      </Components.ExpansionPanel>
    </View>
  )
})
