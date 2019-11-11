// Enzyme setup - http://airbnb.io/enzyme/docs/installation/index.html
const Adapter = require('enzyme-adapter-react-16')
const {configure} = require('enzyme')

configure({adapter: new Adapter()})
// import Adapter from 'enzyme-adapter-react-16'
// import {configure} from 'enzyme'

// configure({adapter: new Adapter()})