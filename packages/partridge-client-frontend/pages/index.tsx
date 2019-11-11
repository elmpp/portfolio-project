import React from 'react'
import {logger} from 'partridge-logging'
import {TestHero} from 'partridge-client-components'
import { NextPage } from 'next';

logger.log('warn', 'this is on both the client and server side', {
  runtime_label: 'FRONTEND',
  dumpables: {error: [{message: 'something'}]},
})

interface PageProps {
  pathname: string
  // @todo - additional props from next-routes
}

// primer theme - https://tinyurl.com/y67hr78y
const Page: NextPage<PageProps> = () => (
  <TestHero />
)

export default Page