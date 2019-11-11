export type PlatformOSType = 'android' | 'ios' | 'web'

export type PlatformSelectSpecifics<T> = {
  [platform in PlatformOSType | 'default']?: T
}

export interface PlatformSelectOptions {
  fallbackToWeb?: boolean
}

export type PlatformSelect<T> = (
  specifics: PlatformSelectSpecifics<T>,
  options: PlatformSelectOptions,
) => T
