/**
 * Suitable for bundling with web targets (i.e. browser)
 * 
 * As we're doing SSR, this need only pull from well-known "window" location. Simples.
 * Any overridding by env vars will have already occurred on server
 * 
 *  - deserializing after serialize-javascript - https://tinyurl.com/ybndynpr
 */


exports.config = eval('(' + window.__CONFIG + ')')


const {FeedSupplierName} = require('../dist/__types__/config')
exports.FeedSupplierName = FeedSupplierName
