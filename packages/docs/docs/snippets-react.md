---
id: snippets-react
title: Snippets (react)
sidebar_label: React TS Snippets
---

# React



## Elements

These are the _result of rendering_

#### Built in (intrinsic) types

e.g. <a>, <input>  etc etc

```javascript
// https://tinyurl.com/yyb2dbob
const element: JSX.IntrinsicElements = <div>Something</div>
```

#### Functional Types

```javascript
// https://tinyurl.com/yyb2dbob
const Component: React.FunctionalComponent<{}> = () => (<div>Something</div>)
const element: JSX.Element = <Component />
```

#### Class Types

```javascript
// https://tinyurl.com/yyb2dbob
class Component extends React.Component<{}, {}> {
    render{
        return <div>Something</div>
    }
}

const element: JSX.ElementClass = <Component />
```

#### Generic

An alternative simple way of doing it is by using the generic type:

```javascript
const element: React.ElementType = <AnyVersionOfComponent />
```

#### Utils

To extract the props from an existing component:

```javascript
import Component from 'something'
type ComponentProps = React.ComponentProps<typeof Component>
```

## Components

These are _renderable_

#### Functional components

```javascript
// https://tinyurl.com/y5mxfkoj
import React, { FunctionComponent } from 'react'; // importing FunctionComponent

type CardProps = {
  title: string,
  paragraph: string
}

export const Card: FunctionComponent<CardProps> = ({ title, paragraph }) => <aside>
  <h2>{ title }</h2>
  <p>
    { paragraph }
  </p>
</aside>
```

#### Class Components

Normal:

```javascript
// https://tinyurl.com/y5mxfkoj
import React from 'react'

export class Clock extends React.Component<ClockProps, ClockState> {
 ...
```

Pure:

```javascript
// https://tinyurl.com/y5mxfkoj
import React from 'react'

export class PureClock extends React.PureComponent<PureClockProps, PureClockState> {
 ...
```

#### Generic

An alternative way of doing this is to just use the generic type:

```javascript
const Component: React.ElementType = props => (<div>Something</div>)
```

#### Get the props of a component

```javascript
// https://tinyurl.com/y2xwwzqb
import { View } from 'react-native';
type Props = React.ComponentProps<typeof View>;
```

#### Refs

```javascript
// SO - https://tinyurl.com/y5eyjqz2
private stepInput: React.RefObject<HTMLInputElement>
```

### Intrinsic elements (i.e. div etc)

```javascript
return <div {...props as React.HTMLAttributes<React.HTMLDivElement>} style={style as React.CSSProperties} />
```

## Children

```javascript
children: React.Element // single, required, non-text child (suitable for React.cloneElement)
children: React.ReactChild // single, required element or text child
children: React.Node // ReactChild | ReactFragment | ReactPortal | boolean | null | undefined
```
