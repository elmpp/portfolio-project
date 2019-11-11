import React from 'react'
import {Link} from '../../libs/link'
import {Text} from '../../libs/text'

export const Menu: React.FC = () => (
  <>
    <Link to="/about">
      <Text>About</Text>
    </Link>
    <Link to="/error">
      <Text>Error</Text>
    </Link>
  </>
)
