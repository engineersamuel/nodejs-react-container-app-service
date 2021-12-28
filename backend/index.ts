import cors from 'cors';
import express from 'express';
import path from 'path';
import healthApi from './src/api/health';
import helloApi from './src/api/hello';

const app = express();
const port = process.env.PORT as unknown as number || 3000;
const host = process.env.HOST || '0.0.0.0';

app.use(cors());

app.use(express.static('public'));

app.get('/api/hello', helloApi);

app.get('/api/health', healthApi);

app.get('*', async (req: express.Request, res: express.Response) => {
  res.sendFile(path.join(__dirname, '/public/index.html'));
});

app.listen(port, host, () => {
  // eslint-disable-next-line no-console
  console.log(`Backend listening at http://${host}:${port} on pid: ${process.pid}`);
});
