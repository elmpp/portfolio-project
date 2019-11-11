import {asyncComponent} from '@jaredpalmer/after'

export interface RouteDef {
  path: string
  exact: boolean
  component: ReturnType<typeof asyncComponent> | React.ComponentType
}
