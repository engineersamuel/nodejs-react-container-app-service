import express from 'express';

const helloApi = async (req: express.Request, res: express.Response) => {
  // const name: string = req.query.name?.toString();

  // Set Headers
  res.set('Content-type', 'application/json');

  // Send response
  res.send({
    message: `Hello from backend at ${new Date().toLocaleString()}`
  });
};

export default helloApi;
