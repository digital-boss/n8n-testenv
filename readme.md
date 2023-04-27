# n8n Test Environment for new Base Node

An environment for testing new n8n base nodes to prepare a merge in [core repo](https://github.com/n8n-io/n8n).

The docker image contains n8n, compiled from sources, from a separate branch with new base node included. 

## Building docker image

- run `./generate-key.sh` and update `N8N_ENCRYPTION_KEY` variable in `.env`
- `make build`

## Start and stop

- `make up` to start 
- `make down` to stop

After services started, open following urls in your browser:

- http://localhost:5678/ n8n
- http://localhost:8081/ mitm proxy


## Writing Test Workflows Using `node:assert` in Code Node

You can use `node:assert` package in Code Node to write assertions, comparing expected results with actual. 

To alow use `node:assert` package in Code Node, `NODE_FUNCTION_ALLOW_BUILTIN` is set to `*` (allow using any builtin packages).

Example of Code Node content:

```js
const assert = require('node:assert');

assert.deepStrictEqual(JSON.parse(JSON.stringify(items[0].json)), {
   "headers": {
      "Content-Type": "application/x-www-form-urlencoded"
   },
   "method": "POST",
   "form": {
      "auth_info": "{}",
      "params": '{"login":"a","name":"abc","refnum":"a","i_customer":1}'
   },
   "uri": "/rest/Customer/get_customer_info"
}
);

return [];
```

If `assert.deepStrictEqual` failed, it throws an exception and we can see red node in workflow execution, meaning that test is failed.