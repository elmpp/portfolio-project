import {Config} from 'partridge-config'
import { NextContext } from 'next';

declare module "next" {
  // generic sfc for Next
  export interface NextClassComponent<P = {}> extends React.ComponentClass<P> {
    getInitialProps: (ctx: NextContext) => Promise<any>;
  }
  // export interface NextStatelessComponent<P = {}> extends React.StatelessComponent<P> {
  //   getInitialProps: (ctx: NextContext) => Promise<any>;
  // }
}