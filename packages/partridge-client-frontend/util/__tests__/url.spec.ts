// Node URL structure - https://goo.gl/CdhSdK

import {buildUrl, UrlPartTypes} from '../url'

describe('url', () => {
  const testMap: [string, URL, Record<string, string>, string][] = [
    // cascade and applies supplied vals
    [
      'https://abc.com/pathname?search=searchparam#hash',           // current href
      new URL('http://cba.co.uk'),                                  // "overriding href" as a string. This will be parsed so can include as much or little as required
      {                                                             // overridable segments. These trump the "overriding string"
        [UrlPartTypes.PORT]: '345',
        [UrlPartTypes.HASH]: 'new_hash'
      },
      'http://cba.co.uk:345/pathname?search=searchparam#new_hash',  // expected href
    ],
    [
      'https://abc.com:345/pathname?search=searchparam#hash',
      new URL('http://cba.co.uk'),
      {
        [UrlPartTypes.PATHNAME]: 'newpathname'
      },
      'http://cba.co.uk:345/newpathname?search=searchparam#hash',
    ],
    // retains current port..
    [
      'https://abc.com:555',
      new URL('http://cba.co.uk'),
      {},
      'http://cba.co.uk:555/',
    ],
    // ignores protocol-specific ports
    [
      'https://abc.com:433',
      new URL('http://cba.co.uk'),
      {},
      'http://cba.co.uk/',
    ],
    [
      'https://abc.com:80',
      new URL('http://cba.co.uk'),
      {},
      'http://cba.co.uk/',
    ],
  ]

  it('creates URL objects based on supplied values', () => {
    testMap.forEach(([currentHref, newHref, newParts, expectedHref]) => {
      const newUrl = buildUrl({href: new URL(currentHref), newHref, newParts})
      expect(newUrl.href).toEqual(expectedHref)
    })
  })
})