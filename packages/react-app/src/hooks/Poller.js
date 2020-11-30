import { useEffect, useRef } from "react";

export default function usePoller(fn, delay, extraWatch) {
  const savedCallback = useRef();
  // Remember the latest fn.
  useEffect(() => {
    savedCallback.current = fn;
  }, [fn]);
  // Set up the interval.
  // eslint-disable-next-line consistent-return
  useEffect(() => {
    console.log("tick")
    function tick() {
      savedCallback.current();
    }
    if (delay !== null) {
      const id = setInterval(tick, delay);
      return () => clearInterval(id);
    }
  }, [delay]);
  // run at start too
  useEffect(() => {
    fn();
    // FIXME: https://github.com/austintgriffith/scaffold-eth/pull/70#issuecomment-727628897
    // eslint-disable-next-line react-hooks/exhaustive-deps
  },[ extraWatch ]);
}
