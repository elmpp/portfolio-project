import React from 'react'
import {CommonPropsContextConsumer, CommonProps} from '../modules/layout/context' // eslint-disable-line import/named
import Layout from '../modules/layout/responsive-layout'

const CollapsedSynopsis = ({collapsed, category1Name, category3Name}: CommonProps) => (
  <React.Fragment>
    <h1>Collapsed: {`${collapsed}`}</h1>
    <h3>Category1Name: {category1Name}</h3>
    <h3>Category3Name: {category3Name}</h3>
  </React.Fragment>
)

export default () => (
  <Layout title={'Home page baby'}>
    <CommonPropsContextConsumer>
      {(props) => {
        return (
          <React.Fragment>
            <h1>This is MOBILE host</h1>
            <CollapsedSynopsis {...props!} />
          </React.Fragment>
        )
      }}
    </CommonPropsContextConsumer>
  </Layout>
)
