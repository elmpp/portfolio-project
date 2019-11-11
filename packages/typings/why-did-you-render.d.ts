declare namespace React {
  interface FunctionComponent<P = {}> {
    whyDidYouRender?: boolean|WhyDidYouRender.WhyDidYouRenderOptions;
  }
  namespace Component {
    export const whyDidYouRender: boolean|WhyDidYouRender.WhyDidYouRenderOptions;
  }
}