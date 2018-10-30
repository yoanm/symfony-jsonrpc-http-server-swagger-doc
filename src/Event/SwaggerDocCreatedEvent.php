<?php
namespace Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Event;

use Yoanm\JsonRpcServerDoc\Domain\Model\HttpServerDoc;
use Yoanm\SymfonyJsonRpcHttpServerDoc\Event\DocEvent;

/**
 * Class SwaggerDocCreatedEvent
 */
class SwaggerDocCreatedEvent extends DocEvent
{
    const EVENT_NAME = 'json_rpc_http_server_swagger_doc.array_created';

    /** @var array */
    private $swaggerDoc;
    /** @var HttpServerDoc|null */
    private $serverDoc;

    /**
     * @param array              $swaggerDoc
     * @param HttpServerDoc|null $serverDoc
     */
    public function __construct(
        array $swaggerDoc,
        HttpServerDoc $serverDoc = null
    ) {
        $this->swaggerDoc = $swaggerDoc;
        $this->serverDoc = $serverDoc;
    }

    /**
     * @return HttpServerDoc
     */
    public function getSwaggerDoc()
    {
        return $this->swaggerDoc;
    }

    /**
     * @return HttpServerDoc|null
     */
    public function getServerDoc()
    {
        return $this->serverDoc;
    }

    /**
     * @param array $swaggerDoc
     *
     * @return SwaggerDocCreatedEvent
     */
    public function setSwaggerDoc(array $swaggerDoc)
    {
        $this->swaggerDoc = $swaggerDoc;

        return $this;
    }
}
