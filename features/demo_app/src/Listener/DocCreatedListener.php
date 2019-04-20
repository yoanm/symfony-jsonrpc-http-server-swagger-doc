<?php
namespace DemoApp\Listener;

use Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Event\SwaggerDocCreatedEvent;

/**
 * Class DocCreatedListener
 */
class DocCreatedListener
{
    /**
     * @param SwaggerDocCreatedEvent $event
     */
    public function enhanceMethodDoc(SwaggerDocCreatedEvent $event) : void
    {
        $swaggerDoc = $event->getSwaggerDoc();
        $swaggerDoc['externalDocs'] = [
            'description' => 'Find out more about Swagger',
            'url' => 'http://swagger.io',
        ];

        $event->setSwaggerDoc($swaggerDoc);
    }
}
