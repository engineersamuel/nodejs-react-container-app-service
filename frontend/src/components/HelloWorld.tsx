import React, { useEffect } from 'react';

type Props = {};

const helloApiPath = '/api/hello';
const domain = process.env.NODE_ENV !== 'production' ? 'http://localhost:3000' : '';
const helloApiEndpoint = `${domain}${helloApiPath}`;

const HelloWorld: React.FC<Props> = () => {
  const [message, setMessage] = React.useState('');

  const callHelloApi = async () => {
    const data = await fetch(helloApiEndpoint);
    const json = await data.json();

    if (json.message) {
      setMessage(json.message);
    }
  };

  useEffect(() => {
    callHelloApi();
  }, []);

  return (
    <p>
      {message}
    </p>
  );
};

export default HelloWorld;
