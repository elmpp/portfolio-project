import React from 'react'
import {StyleSheet, GestureResponderEvent} from 'react-native'
import {ExpansionPanel} from '../../common/library/expansion-panel'
import {smallStyleVariables as styleVariables, sharedStyle, createStyleSheet} from '../../../styles'
import {Surface} from '../../../libs/surface'
import {List} from '../../../libs/list'
import {HeaderRow} from './header-row'
import {TouchableOpacity} from '../../common/library/touchable-opacity'

interface LeftColumnProps {
  names: string[]
  pressHandler: (event: GestureResponderEvent) => void
  isOpen: boolean
  width: number
}

export const LeftColumn: React.FC<LeftColumnProps> = ({names, pressHandler, isOpen, width}) => {
  return (
    <ExpansionPanel plane="width" isOpen={isOpen} closedSize={width} style={styles.expander}>
      <Surface style={[styles.container, isOpen && styles.active]}>
        <TouchableOpacity onPress={pressHandler}>
          <>
          <HeaderRow />
          {names.map(name => (
            <LeftColumnItem key={`left-column-item-${name}`} name={name} />
          ))}
          </>
        </TouchableOpacity>
    </Surface>
      </ExpansionPanel>
  )
}

// const LeftColumnItem: React.FC<{name: string}> = ({name}) => <List.Item style={styles.item} title={name} />
const LeftColumnItem: React.FC<{name: string}> = ({name}) => <List.Item style={styles.item} descriptionStyle={styles.item_text} title="" description={name} />

const styles = createStyleSheet(theme => ({
  expander: {
    zIndex: 2,
    ...sharedStyle.horizontal,
  },
  container: {
    ...sharedStyle.vertical,
    paddingRight: styleVariables.spacingScale[2],
    // zIndex: 200,
    // ...sharedStyle.backgroundFill,
    // ...sharedStyle.redline,
    elevation: 3,
    marginBottom: sharedStyle.activeSurface.elevation,
    marginRight: 2,
    marginLeft: 1,

  },
  item: {
    minHeight: styleVariables.listRowHeight,
    ...sharedStyle.verticalCenter,
    paddingLeft: styleVariables.spacingScale[2],
  },
  item_text: {
    // fontSize: theme.fonts.thin,
    ...theme.fonts.medium,
  },
  active: {
    ...sharedStyle.activeSurface,
  },
}))
