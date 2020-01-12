<?php
namespace Tests\Functional\Endpoint;

use PHPUnit\Framework\TestCase;
use Prophecy\Prophecy\ObjectProphecy;
use Yoanm\JsonRpcServerDoc\Domain\Model\HttpServerDoc;
use Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Event\SwaggerDocCreatedEvent;

/**
 * @covers \Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\Event\SwaggerDocCreatedEvent
 */
class SwaggerDocCreatedEventTest extends TestCase
{
    /** @var SwaggerDocCreatedEvent */
    private $event;

    /** @var array */
    private $swaggerDoc;
    /** @var HttpServerDoc|ObjectProphecy */
    private $serverDoc;

    protected function setUp(): void
    {
        $this->swaggerDoc = ['swaggerDoc'];
        $this->serverDoc = $this->prophesize(HttpServerDoc::class);

        $this->event = new SwaggerDocCreatedEvent(
            $this->swaggerDoc,
            $this->serverDoc->reveal()
        );
    }

    public function testShoulManageSwaggerDocAndServerDoc()
    {
        $this->assertSame($this->swaggerDoc, $this->event->getSwaggerDoc());
        $this->assertSame($this->serverDoc->reveal(), $this->event->getServerDoc());
    }

    public function testSwaggerDocShouldBeOverridable()
    {
        $opeapiDoc = ['my-doc'];
        $this->event->setSwaggerDoc($opeapiDoc);
        $this->assertSame($opeapiDoc, $this->event->getSwaggerDoc());
    }
}
