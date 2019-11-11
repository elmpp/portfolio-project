import {
  ViewStyle as RNViewStyle,
  ScrollView as RNScrollView,
  Animated as RNAnimated,
  NativeMethodsMixinStatic as RNNativeMethodsMixinStatic,
} from 'react-native'

export namespace ExtendedReactNative {
  // Animated API isn't typed atm -------------
  // - SO - https://tinyurl.com/y2gjzh76
  type MaybeAnimated<T> = T | RNAnimated.Value
  type AnimatedScalar = string | number

  type AnimatedStyles<T> = {
    [Key in keyof T]: T[Key] extends AnimatedScalar
      ? MaybeAnimated<T[Key]>
      : T[Key] extends Array<infer U>
      ? Array<AnimatedStyles<U>>
      : AnimatedStyles<T[Key]>
  }

  export type ViewStyle = AnimatedStyles<RNViewStyle>

  export type ScrollView = AnimatedStyles<RNScrollView> // animated refs - https://tinyurl.com/y5nydz7z
  // Animated API eof -------------

  // Augments the ref objects to include NativeProps and Native methods - https://tinyurl.com/y4u2e23u
  export interface RefObject<T> {
    readonly current: (T & RNNativeMethodsMixinStatic & {getNode: () => T & RNNativeMethodsMixinStatic}) | null
  }
}
