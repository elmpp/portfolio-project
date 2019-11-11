export enum UrlPart {
  HASH = 'hash',
  HOST = 'host',
  HOSTNAME = 'hostname',
  HREF = 'href',
  PASSWORD = 'password',
  PATHNAME = 'pathname',
  PORT = 'port',
  PROTOCOL = 'protocol',
  SEARCH = 'search',
  USERNAME = 'username',
}

export type NewPart = {
  [K in UrlPart]?: any
 }

export interface BuildUrlArgs {
  href: URL | string
  newHref: URL
  newParts?: NewPart
}

export const buildUrl = ({href, newHref, newParts}: BuildUrlArgs): URL => {
  
  try {
    if (typeof href === "string") {
      href = new URL(href)
    }
  }
  catch (error) {
    throw new Error(`Unable to parse requested url string. ${JSON.stringify({newHref, href})}`)
  }

  
  // apply the parts to our new url
  if (newParts) {
    newHref = Object.keys(newParts).reduce((acc, newPartKey) => {
      acc[newPartKey as UrlPart] = newParts[newPartKey as UrlPart]
      return acc
    }, newHref)
  }

  // now apply to the current url using the enum as property bounds
  for (const partKey in UrlPart) {  // https://goo.gl/xLpYQZ
    const partKeyValue = UrlPart[partKey] as UrlPart
    
    // some weird excemptions
    if (partKeyValue === UrlPart.HREF) continue
    if (partKeyValue === UrlPart.PATHNAME && newHref[partKeyValue] === '/') continue

    const newPartValue = newHref[partKeyValue as UrlPart]
    if (newPartValue) {
      href[partKeyValue as UrlPart] = newPartValue
    }
  }

  return href
}
