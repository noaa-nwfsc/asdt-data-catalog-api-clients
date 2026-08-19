import { Configuration, DefaultApi } from './generated';

export * from './generated';

function toCamelCase(str: string): string {
  return str.replace(/_([a-z0-9])/g, (g) => g[1].toUpperCase());
}

export class NWFSCDataCatalog {
  private api: DefaultApi;

  constructor(basePath?: string) {
    const config = new Configuration({ basePath });
    this.api = new DefaultApi(config);

    return new Proxy(this, {
      get(target, prop, receiver) {
        if (prop in target) {
          return (target as any)[prop];
        }

        const propStr = String(prop);
        if (propStr.startsWith('fetch_all_')) {
          const baseMethodName = propStr.replace('fetch_all_', 'get_');
          const camelBaseMethodName = toCamelCase(baseMethodName);
          const apiMethod = (target.api as any)[camelBaseMethodName];

          if (typeof apiMethod === 'function') {
            return async function (requestParams: any = {}, initOverrides?: any) {
              const allData: any[] = [];
              const limit = requestParams.limit || 1000;
              let offset = requestParams.offset || 0;

              while (true) {
                const params = { ...requestParams, limit, offset };
                const batch = await apiMethod.call(target.api, params, initOverrides);
                if (!batch || batch.length === 0) {
                  break;
                }
                allData.push(...batch);
                offset += limit;
              }
              return allData;
            };
          }
        }

        if (propStr.startsWith('read_')) {
          const baseMethodName = propStr.replace('read_', 'get_');
          const camelBaseMethodName = toCamelCase(baseMethodName);
          const apiMethod = (target.api as any)[camelBaseMethodName];
          if (typeof apiMethod === 'function') {
            return function (requestParams: any = {}, initOverrides?: any) {
              return apiMethod.call(target.api, requestParams, initOverrides);
            };
          }
        }

        const camelProp = toCamelCase(propStr);
        if (typeof (target.api as any)[camelProp] === 'function') {
          return (target.api as any)[camelProp].bind(target.api);
        }

        return (target.api as any)[prop];
      }
    }) as any;
  }
}
