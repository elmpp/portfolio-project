import React from 'react'
import {View} from 'react-native'
import {styled} from '../../styles'
import {space, layout, typography, color, flex, compose, SpaceProps, LayoutProps, ColorProps, FlexProps} from 'styled-system'
import { StyledComponentProps } from 'styled-components';


type StyledSystemProps<
  C extends keyof JSX.IntrinsicElements | React.ComponentType<any>,
  P extends object
> = StyledComponentProps<C, any, P, never> & {
  as?: keyof JSX.IntrinsicElements | React.ComponentType<any>;
};


type StyledPocProps = StyledSystemProps<typeof View, SpaceProps & LayoutProps & ColorProps & FlexProps>
const StyledPocComponent: React.FC<StyledPocProps> = ({style, ...props}) => {

  return (
    <View style={style} {...props} />
  )
}

export const StyledPoc = styled(StyledPocComponent)<StyledPocProps>(props => ({backgroundColor: 'violet'}), compose(
    space,
    layout,
    typography,
    color,
    flex,
  ))
