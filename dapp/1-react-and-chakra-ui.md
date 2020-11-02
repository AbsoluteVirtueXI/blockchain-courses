# React and Chakra UI

## Chakra UI

### CSS libraries vs UI framework

Chakra is an UI framework.  
Chakra under the hood uses `emotion`, a `CSS-in-JS` library inspired by `styled-component`.  
**Chakra UI**: https://next.chakra-ui.com/

> Chakra UI is a simple, modular and accessible component library that gives you all the building blocks you need to build your React applications.

So Chakra provides pre-made component for commons UI elements like: headings, text, image, inputs, buttons, forms, modals, progress bars, check boxes, etc...

A full list of all the available components are documented on their web site: https://next.chakra-ui.com/getting-started

### installation

```zsh
% npx create-react-app react-example-1
% cd react-example-1
% yarn add @chakra-ui/core@next framer-motion focus-visible
```

### Setting a React project with Chakra UI

Delete all css files and the react logo in the `src/` directory:

```zsh
% cd src
% rm *.css *.svg
```

Clean you _App.js_ and remove unnecessary code.  
_App.js_:

```js
import React from 'react'

function App() {
  return <></>
}

export default App
```

Rewrite your _index.js_ as follow:  
_index.js_:

```js
import React from 'react'
import ReactDOM from 'react-dom'
import reportWebVitals from './reportWebVitals'
import { ChakraProvider, theme } from '@chakra-ui/core'
import 'focus-visible/dist/focus-visible'
import App from './App'

ReactDOM.render(
  <React.StrictMode>
    <ChakraProvider theme={theme} resetCSS={true}>
      <App />
    </ChakraProvider>
  </React.StrictMode>,
  document.getElementById('root')
)

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals()
```

For Chakra UI to work correctly, you need to setup the `ChakraProvider` at the root of your application.
In _index.js_ we wrap the `<App />`component with the `ChakraProvider`, this way all our app can access Chakra context like globals and theme.  
The `theme` prop provides all theming values, like colors, sizes, fonts. We can extend the default imported `theme`.
The `resetCSS` prop, if set to `true`, removes all browser default styles.

### Usage

Rewrite the _App.js_ file and add a "Hello world!" heading:
_App.js_:

```js
import React from 'react'
import { Heading, Text, Center, Button } from '@chakra-ui/core'

function App() {
  return (
    <>
      <Center>
        <Heading>Hello World!!</Heading>
      </Center>
      <Text>Welcome to my first react + chakra app</Text>
      <Button
        colorScheme="purple"
        color="red.400"
        onClick={() => {
          console.log('Please do better than just a console.log()')
        }}
      >
        Click me
      </Button>
    </>
  )
}

export default App
```

Here we import 4 component from `@chakra-ui/core`:

- `Heading`: A component for titles and headlines. It renders an `<h2>` tag by default.  
  https://next.chakra-ui.com/docs/typography/heading
- `Text`: A component for writing text. `Text` is the used to render text and paragraphs within an interface. It renders a `<p>` tag by default.  
  https://next.chakra-ui.com/docs/typography/text
- `Center`: Center is a layout component that centers its child within itself.  
  https://next.chakra-ui.com/docs/layout/center
- `Button`: The Button component is used to trigger an action or event, such as submitting a form, opening a dialog, canceling an action, or performing a delete operation.  
  https://next.chakra-ui.com/docs/form/button

Each components can be configured with props.
Passed props can change the layout of the component like color and background color, alignment, size, margin, padding.
Please check the documentation of a component for finding all the available props.

### run

Start the react development server from your root directory:

```zsh
% yarn start
```

### Chakra component:

All available components with their document and code sample are available on the official website:
https://next.chakra-ui.com/docs/getting-started

## Project layout

...

## First example

https://github.com/AbsoluteVirtueXI/react-example-1
