<?php
namespace Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Provider;

use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;
use Yoanm\JsonRpcHttpServerSwaggerDoc\Infra\Normalizer\DocNormalizer;
use Yoanm\SymfonyJsonRpcHttpServerDoc\Creator\HttpServerDocCreator;
use Yoanm\SymfonyJsonRpcHttpServerDoc\Provider\DocProviderInterface;
use Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Event\SwaggerDocCreatedEvent;

/**
 * Class DocProvider
 */
class DocProvider implements DocProviderInterface
{
    /** @var EventDispatcherInterface */
    private $dispatcher;
    /** @var HttpServerDocCreator */
    private $serverDocCreator;
    /** @var DocNormalizer */
    private $docNormalizer;

    /**
     * @param EventDispatcherInterface $dispatcher
     * @param HttpServerDocCreator     $serverDocCreator
     * @param DocNormalizer            $docNormalizer
     */
    public function __construct(
        EventDispatcherInterface $dispatcher,
        HttpServerDocCreator $serverDocCreator,
        DocNormalizer $docNormalizer
    ) {
        $this->dispatcher = $dispatcher;
        $this->serverDocCreator = $serverDocCreator;
        $this->docNormalizer = $docNormalizer;
    }

    /**
     * @param string|null $host
     *
     * @return array
     *
     * @throws \ReflectionException
     */
    public function getDoc($host = null) : array
    {
        $rawDoc = $this->serverDocCreator->create($host);
        $swaggerDoc = $this->docNormalizer->normalize($rawDoc);

        $event = new SwaggerDocCreatedEvent($swaggerDoc, $rawDoc);
        $this->dispatcher->dispatch($event, $event::EVENT_NAME);

        return $event->getSwaggerDoc();
    }

    /**
     * {@inheritdoc}
     */
    public function supports($filename, $host = null) : bool
    {
        return 'swagger.json' === $filename;
    }
}
