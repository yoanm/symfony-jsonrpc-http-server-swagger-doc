# Symfony JSON-RPC Http server swagger documentation

[![License](https://img.shields.io/github/license/yoanm/symfony-jsonrpc-http-server-swagger-doc.svg)](https://github.com/yoanm/symfony-jsonrpc-http-server-swagger-doc)
[![Code size](https://img.shields.io/github/languages/code-size/yoanm/symfony-jsonrpc-http-server-swagger-doc.svg)](https://github.com/yoanm/symfony-jsonrpc-http-server-swagger-doc)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github\&repo=yoanm/symfony-jsonrpc-http-server-swagger-doc)](https://dependabot.com)

[![Scrutinizer Build Status](https://img.shields.io/scrutinizer/build/g/yoanm/symfony-jsonrpc-http-server-swagger-doc.svg?label=Scrutinizer\&logo=scrutinizer)](https://scrutinizer-ci.com/g/yoanm/symfony-jsonrpc-http-server-swagger-doc/build-status/master)
[![Scrutinizer Code Quality](https://img.shields.io/scrutinizer/g/yoanm/symfony-jsonrpc-http-server-swagger-doc/master.svg?logo=scrutinizer)](https://scrutinizer-ci.com/g/yoanm/symfony-jsonrpc-http-server-swagger-doc/?branch=master)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e50269d2b7bc465fa43a9f9000bc5f06)](https://app.codacy.com/gh/yoanm/symfony-jsonrpc-http-server-swagger-doc/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[![CI](https://github.com/yoanm/symfony-jsonrpc-http-server-swagger-doc/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/yoanm/symfony-jsonrpc-http-server-swagger-doc/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/yoanm/symfony-jsonrpc-http-server-swagger-doc/branch/master/graph/badge.svg?token=NHdwEBUFK5)](https://codecov.io/gh/yoanm/symfony-jsonrpc-http-server-swagger-doc)
[![Symfony Versions](https://img.shields.io/badge/Symfony-v4.4%20%2F%20v5.4%2F%20v6.x-8892BF.svg?logo=github)](https://symfony.com/)

[![Latest Stable Version](https://img.shields.io/packagist/v/yoanm/symfony-jsonrpc-http-server-swagger-doc.svg)](https://packagist.org/packages/yoanm/symfony-jsonrpc-http-server-swagger-doc)
[![Packagist PHP version](https://img.shields.io/packagist/php-v/yoanm/symfony-jsonrpc-http-server-swagger-doc.svg)](https://packagist.org/packages/yoanm/symfony-jsonrpc-http-server-swagger-doc)

Symfony bundle for easy JSON-RPC server Swagger 2.0 documentation

Symfony bundle for [yoanm/jsonrpc-http-server-swagger-doc-sdk](https://github.com/yoanm/php-jsonrpc-http-server-swagger-doc-sdk)

## Versions

*   Symfony v3/4 - PHP >=7.1 : `^v0.X`
*   Symfony v4/5 - PHP >=7.2 : `^v1.0`

## How to use

Once configured, your project is ready to handle HTTP `GET` request on `/doc/swagger.json` endpoint. Result will be a swagger compatible file.

See below how to configure it.

## Configuration

[Behat demo app configuration folders](./features/demo_app) can be used as examples.

*   Add the bundles in your config/bundles.php file:
    ```php
    // config/bundles.php
    return [
        ...
        Symfony\Bundle\FrameworkBundle\FrameworkBundle::class => ['all' => true],
        Yoanm\SymfonyJsonRpcHttpServer\JsonRpcHttpServerBundle::class => ['all' => true],
        Yoanm\SymfonyJsonRpcHttpServerDoc\JsonRpcHttpServerDocBundle::class => ['all' => true],
        Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\JsonRpcHttpServerSwaggerDocBundle::class => ['all' => true],
        ...
    ];
    ```

*   Configure `yoanm/symfony-jsonrpc-http-server` as described on [yoanm/symfony-jsonrpc-http-server](https://github.com/yoanm/symfony-jsonrpc-http-server) documentation.

*   Configure `yoanm/symfony-jsonrpc-http-server-doc` as described on [yoanm/symfony-jsonrpc-http-server-doc](https://github.com/yoanm/symfony-jsonrpc-http-server-doc) documentation.

*   Query your project at `/doc/swagger.json` endpoint and you will have a swagger json documentation file of your server.

## Event

You are able to enhance resulting documentation by listening on `json_rpc_http_server_swagger_doc.array_created` event.

See below an example of listener service configuration:

```yaml
  method_doc_created.listener:
    class: Full\Namespace\DocCreatedListener # <-- replace by your class name
    tags:
      - name: 'kernel.event_listener'
        event: 'json_rpc_http_server_swagger_doc.array_created'
        method: 'enhanceMethodDoc' # <-- replace by your method name
```

You will receive an event of type [`SwaggerDocCreatedEvent`](./src/Event/SwaggerDocCreatedEvent.php).

You can take example on Behat [`DocCreatedListener`](./features/demo_app/src/Listener/DocCreatedListener.php)

## Contributing

See [contributing note](./CONTRIBUTING.md)
