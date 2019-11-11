/**
 * RNVI Icon component - https://tinyurl.com/y3vo5n8n
 * All RNVI icons available - https://tinyurl.com/ycg6y7c9
 * All MaterialCommunityIcons available - https://tinyurl.com/y4zsp3x7
 */
import React from 'react'
import {useTheme} from '../../styles'
import {VectorIcons} from '../../libs/vector-icons'
import { useSmallDimensions } from '../../hooks/use-small-dimensions'
import { styleVariables } from '../../styles'

type IconProps = React.ComponentProps<typeof VectorIcons>
export const Icon: React.FC<IconProps> = (props) => {
  const size = useSmallDimensions() ? styleVariables.fontScale[6] : styleVariables.fontScale[8]
  const color = useTheme().colors.primary

  return <VectorIcons size={size} color={color} {...props} />
}
