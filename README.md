# GATCG API

This is a work in progress! Expect LOTS of changes, but please feel free to file issues and/or PR's!

A modeled version of the Grand Archive TCG API, using [Smithy].

This is a community maintained project, not endorsed by Weebs of the Shore.

## Usage

1. Run `smithy build` in your CLI
1. Set your node module dependency to the file location: `/path/to/this/repo/build/smithy/source/typescript-client-codegen`

### Example

```typescript
import { GatcgClient, GetCardCommand } from 'gatcg-api-client'

const client = new GatcgClient({endpoint: "https://api.gatcg.com" });

try {
    const result = await client.send(new GetCardCommand({ slug: "slimeshield" }));
    console.log(result);
} catch (err) {
    console.error(err);
}
```

## API Documentation

- <https://index.gatcg.com/api>

## Other links

- [Smithy](https://smithy.io)

## Copyright

Any illustrations, trademarks, are copyright of © Weebs of the Shore <https://www.gatcg.com/>
