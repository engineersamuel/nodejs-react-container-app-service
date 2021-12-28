const Config = {
  // In development point to the local default node, otherwise blank so that
  // the urls will resolve to the location.origin
  backendUrl: process.env.NODE_ENV !== 'production' ? 'http://localhost:3000' : ''
};

export default Config;
