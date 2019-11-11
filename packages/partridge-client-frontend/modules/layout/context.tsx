// responsible for setting up any context that may be required further down the tree
import { withRouter } from 'next/router';
import React from 'react';
import _ from 'lodash'
import { WithRouterProps } from 'next/dist/client/with-router';

// React context api - https://goo.gl/zqjNUx
export const {Provider: CommonPropsContextProvider, Consumer: CommonPropsContextConsumer} = React.createContext<
  CommonProps | undefined
>(undefined)

export interface CommonProps {
  collapsed: boolean
  category1Name: string
  category3Name: string
}
interface UserSuppliedContextProps {
  children: JSX.Element | JSX.Element[]
  collapsed: CommonProps['collapsed']
}
type ContextProps = UserSuppliedContextProps & WithRouterProps

const Context = (props: ContextProps) => {
  const {children, router, collapsed} = props
  
  if (!router) throw Error('router not here')

  const commonProps = {
    collapsed,
    category1Name: _.get(router, 'query.category1Name') as string,
    category3Name: _.get(router, 'query.category3Name') as string,
  }
  return <CommonPropsContextProvider value={commonProps}>{children}</CommonPropsContextProvider>
}

export default withRouter<ContextProps>(Context) // https://goo.gl/mkWbBM
