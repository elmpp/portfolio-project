/**
 *
 *   - defining stories (using legacy `storiesOf` api) - https://tinyurl.com/y3dx4kdx
 */

import React from 'react'
import {storiesOf} from '../lib'
import {addCommonDecorators, addCommonParameters, VerticalSpace} from './common'
import {Components} from 'partridge-client-components'
import {FeedSupplierName} from 'partridge-config'
import {mockOutcomeView} from '../mock'
import {Button as RNPButton} from 'react-native-paper'
import { select, text } from '@storybook/addon-knobs'

const storiesDef = storiesOf('Partridge Domain Components', module)
addCommonDecorators(storiesDef, {})
addCommonParameters(storiesDef, {viewport: {defaultViewport: 'iphone6'}})

storiesDef
  .add('Bookie horizontal', () => {
    const feedSupplierKnobSelect = select(
      'FeedSupplierName',
      {
        // knob select - https://tinyurl.com/y5goaa4w
        [FeedSupplierName.coral]: FeedSupplierName.coral,
        [FeedSupplierName.sky]: FeedSupplierName.sky,
        [FeedSupplierName.boylesports]: FeedSupplierName.boylesports,
      },
      FeedSupplierName.coral
    )
    return <Components.BookieLogo name={feedSupplierKnobSelect} />
  })
  .add('Bookie vertical', () => {
    const feedSupplierKnobSelect = select(
      'FeedSupplierName',
      {
        [FeedSupplierName.coral]: FeedSupplierName.coral,
        [FeedSupplierName.sky]: FeedSupplierName.sky,
        [FeedSupplierName.boylesports]: FeedSupplierName.boylesports,
      },
      FeedSupplierName.coral
    )
    return <Components.BookieLogo mode="vertical" name={feedSupplierKnobSelect} />
  })
  .add('Bookie square', () => {
    const feedSupplierKnobSelect = select(
      'FeedSupplierName',
      {
        [FeedSupplierName.coral]: FeedSupplierName.coral,
        [FeedSupplierName.sky]: FeedSupplierName.sky,
        [FeedSupplierName.boylesports]: FeedSupplierName.boylesports,
      },
      FeedSupplierName.coral
    )
    return <Components.BookieLogo mode="square" name={feedSupplierKnobSelect} />
  })
  .add('Bookie circle', () => {
    const feedSupplierKnobSelect = select(
      'FeedSupplierName',
      {
        [FeedSupplierName.coral]: FeedSupplierName.coral,
        [FeedSupplierName.sky]: FeedSupplierName.sky,
        [FeedSupplierName.boylesports]: FeedSupplierName.boylesports,
      },
      FeedSupplierName.coral
    )
    return <Components.BookieLogo mode="circle" name={feedSupplierKnobSelect} />
  })
  .add('Bookie chip', () => {
    const feedSupplierKnobSelect = select(
      'FeedSupplierName',
      {
        [FeedSupplierName.coral]: FeedSupplierName.coral,
        [FeedSupplierName.sky]: FeedSupplierName.sky,
        [FeedSupplierName.boylesports]: FeedSupplierName.boylesports,
      },
      FeedSupplierName.coral
    )

    const props: React.ComponentProps<typeof Components.BookieLogoChip> = {
      bookieLogoProps: {
        mode: 'circle',
        name: feedSupplierKnobSelect,
      },
      children: text('odds', '3/1'),
    }

    return <Components.BookieLogoChip {...props} />
  })
  .add('Odds With Icons', () => (
    <Components.OddsButtonWithIcons
      outcomes={Array(3)
        .fill(0)
        .map(() => mockOutcomeView())}
    />
  ))
  .add('React Native Paper Button', () => (
    <RNPButton mode="contained" onPress={() => {}}>
      Something
    </RNPButton>
  ))
  .add('Odds Button', () => (
    <VerticalSpace>
      <Components.OddsButton outcome={mockOutcomeView()} />
    </VerticalSpace>
  ))
