import express from 'express';

const healthApi = async (_req: express.Request, res: express.Response) => {
  res.sendStatus(200);
};

export default healthApi;
