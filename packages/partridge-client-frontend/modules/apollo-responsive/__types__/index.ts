import { Breakpoints, MEDIA_SIZES } from '../media-type-constants';

export interface Options {
  staticMediaType?: MEDIA_SIZES;
  defaultMediaType?: MEDIA_SIZES;
  breakpoints: Breakpoints;
}