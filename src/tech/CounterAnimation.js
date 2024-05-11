import React, { useState, useEffect } from 'react';
import { useSpring, animated } from 'react-spring';

const CounterAnimation = ({ value }) => {
  const [displayValue, setDisplayValue] = useState(0);

  useEffect(() => {
    setDisplayValue(value);
  }, [value]);

  const numberSpring = useSpring({
    number: displayValue,
    from: { number: 0 },
    config: { duration: 1500 }
  });

  return (
    <span>
      {/* Анимированные цифры */}
      <animated.span>{numberSpring.number.interpolate(val => Math.ceil(val))}</animated.span>
    </span>
  );
};

export default CounterAnimation;
