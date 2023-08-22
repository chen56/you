/** @jsxImportSource react */
import { qwikify$ } from '@builder.io/qwik-react';
 
interface Props {
  /**
   * Injected by the documentation to work in an iframe.
   * You won't need it on your project.
   */
  window?: () => Window;
}

// Create React component standard way
function Greetings(props: Props) {
  return <p>Hello from React</p>;
}

// Convert React component to Qwik component
export const QGreetings = qwikify$(Greetings);
