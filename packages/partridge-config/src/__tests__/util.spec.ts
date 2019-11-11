import {parameterise, merge} from '../util'
import {Config} from '../__types__/config'

describe('util', () => {
  const mockConfig = {
    feeds: {
      coral: {
        authSchema: {
          type: 'htAccess',
          username: 'uksharetrading',
          password: 'tsKFEWvv',
        },
      },
    },
    frontend: {
      FRONTEND_API_HOST_SERVER: 'http://api.default/app_dev.php/graphql/',
      FRONTEND_API_HOST_BROWSER: 'http://api.default/app_dev.php/graphql/',
    },
  } as Config
  const mockEnvSubMap = ({
    frontend: {
      FRONTEND_API_HOST_SERVER: 'FRONTEND_API_HOST_SERVER',
      SUB_VALUE_NOT_IN_CONFIG: 'SUB_VALUE_NOT_IN_CONFIG',
    },
    logging: {
      LOGGING_LEVEL: 'LOGGING_LEVEL',
    },
  } as any) as Config
  const mockProcessEnv = {
    FRONTEND_API_HOST_SERVER: 'new_FRONTEND_API_HOST_SERVER',
    SUB_VALUE_NOT_IN_CONFIG: 'new_SUB_VALUE_NOT_IN_CONFIG',
  }

  describe('merge', () => {
    it('merges values', () => {
      const merged = merge(mockConfig, mockEnvSubMap, mockProcessEnv)

      expect(merged).toHaveProperty('frontend.FRONTEND_API_HOST_SERVER', 'new_FRONTEND_API_HOST_SERVER')
      expect(merged).toHaveProperty('frontend.FRONTEND_API_HOST_BROWSER', 'http://api.default/app_dev.php/graphql/')
      expect(merged).toHaveProperty('frontend.SUB_VALUE_NOT_IN_CONFIG', 'new_SUB_VALUE_NOT_IN_CONFIG')
      expect(merged).toHaveProperty('logging', {}) // can't filter out with _.mergeWith ??
    })
  })

  describe('parameterise', () => {
    it('parameterise should allow replacement of port numbers in frontend config', () => {
      const unparameterisedConfig = {
        frontend: {
          FRONTEND_API_HOST_SERVER: 'https://admin.odds4u.com${port}/app.php/graphql/',
          FRONTEND_HOST_WWW_MOBILE: 'https://m.odds4u.com',
        },
      } as Config
      const parameterisedFrontendConfigMap = [
        // port 8081 (non-special)
        {
          frontend: {
            FRONTEND_HOST_WWW_PORT: '8081',
            FRONTEND_API_HOST_SERVER: 'https://admin.odds4u.com:8081/app.php/graphql/',
            FRONTEND_HOST_WWW_MOBILE: 'https://m.odds4u.com',
          },
        },
        // port 80
        {
          frontend: {
            FRONTEND_HOST_WWW_PORT: '80',
            FRONTEND_API_HOST_SERVER: 'https://admin.odds4u.com/app.php/graphql/',
            FRONTEND_HOST_WWW_MOBILE: 'https://m.odds4u.com',
          },
        },
        // port 443
        {
          frontend: {
            FRONTEND_HOST_WWW_PORT: '443',
            FRONTEND_API_HOST_SERVER: 'https://admin.odds4u.com/app.php/graphql/',
            FRONTEND_HOST_WWW_MOBILE: 'https://m.odds4u.com',
          },
        },
      ]

      parameterisedFrontendConfigMap.forEach((parameterisedFrontendConfig: Config) => {
        unparameterisedConfig.frontend.FRONTEND_HOST_WWW_PORT =
          parameterisedFrontendConfig.frontend.FRONTEND_HOST_WWW_PORT
        const parameterised = parameterise(unparameterisedConfig)
        expect(parameterised.frontend).toEqual(expect.objectContaining(parameterisedFrontendConfig.frontend))
      })
    })
  })
})
