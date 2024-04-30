export const generateRandomNumbers = () => {
    const randomNumbers = [];

    for (let i = 0; i < 10; i++) {
      const randomNumber = Math.floor(Math.random() * 1000); 
      randomNumbers.push(randomNumber);
    }
    return randomNumbers;
  };