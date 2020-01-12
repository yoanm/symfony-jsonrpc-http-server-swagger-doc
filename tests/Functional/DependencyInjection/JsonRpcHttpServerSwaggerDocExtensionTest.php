<?php
namespace Tests\Functional\DependencyInjection;

use Tests\Common\DependencyInjection\AbstractTestClass;
use Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\DependencyInjection\JsonRpcHttpServerSwaggerDocExtension;

/**
 * @covers \Yoanm\SymfonyJsonRpcHttpServerSwaggerDoc\DependencyInjection\JsonRpcHttpServerSwaggerDocExtension
 */
class JsonRpcHttpServerSwaggerDocExtensionTest extends AbstractTestClass
{
    public function testShouldBeLoadable()
    {
        $this->loadContainer();

        $this->assertDocProviderIsLoadable();
    }

    public function testShouldReturnAnXsdValidationBasePath()
    {
        $this->assertNotNull((new JsonRpcHttpServerSwaggerDocExtension())->getXsdValidationBasePath());
    }
}
