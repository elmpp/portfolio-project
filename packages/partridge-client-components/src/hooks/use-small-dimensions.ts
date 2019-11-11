import {useDimensions} from './use-dimensions'
import {useSettings} from './use-settings'

export const useSmallDimensions = () => {
  const dimensions = useDimensions()
  const settings = useSettings()

  return settings.layoutSize === 'SMALL' || dimensions.lessThan['md']
}
