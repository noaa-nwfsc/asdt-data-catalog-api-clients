import { NWFSCDataCatalog } from '../src/index';

const catalog = new NWFSCDataCatalog('https://example.com/api');
console.log('Catalog instantiated successfully:', !!catalog);
