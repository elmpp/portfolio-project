import App, {Container, AppContext} from 'next/app'
import React from 'react'
import {ApolloProvider} from 'react-apollo-hooks'
import withApolloClient from '../app/apollo/with-apollo-client'
import {ThemeProvider} from 'partridge-client-components'
// import {theme} from 'styled-system'

export interface MyAppProps {
  apolloClient: any
  Component?: React.ComponentType
}

// const theme = {
//   colors: {
//     primary: '#0070f3',
//   }
// }

class MyApp extends App<MyAppProps> {
  static async getInitialProps({Component, ctx}: AppContext) {
    let pageProps = {}

    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx)
    }

    return {pageProps}
  }

  render() {
    const {Component, pageProps, apolloClient} = this.props
    return (
      <Container>
        <ThemeProvider>
          <ApolloProvider client={apolloClient}>
            {/* <BaseStyles> */}
            {/* <ThemeProvider theme={theme}> */}
            <Component {...pageProps} />
            {/* </ThemeProvider> */}
            {/* </BaseStyles> */}
          </ApolloProvider>
        </ThemeProvider>
      </Container>
    )
  }
}

export default withApolloClient(MyApp)
