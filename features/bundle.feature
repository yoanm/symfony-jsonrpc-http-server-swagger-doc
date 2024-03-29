Feature: demo symfony application

  Scenario: Check that all methods are available
    # Ensure methods with tag have been succesfully loaded
    When I send a "GET" request on "/my-custom-doc-endpoint/swagger.json" demoApp kernel endpoint
    Then I should have a "200" response from demoApp with following content:
    """
    {
      "swagger": "2.0",
      "paths": {
        "/BundledMethodA/../my-custom-endpoint": {
          "post": {
            "summary": "\"bundledMethodA\" json-rpc method",
            "operationId": "BundledMethodA",
            "consumes": ["application/json"],
            "produces": ["application/json"],
            "parameters": [
              {
                "in": "body",
                "name": "JsonRpc request",
                "required": true,
                "schema": {
                  "allOf": [
                    {
                      "type": "object",
                      "required": ["jsonrpc", "method"],
                      "properties": {
                        "id": {"example": "req_id", "type": "string"},
                        "jsonrpc": {"type": "string", "example": "2.0"},
                        "method": {"type": "string"},
                        "params": {"title": "Method parameters"}
                      }
                    },
                    {"type": "object", "properties": {"method": {"example": "bundledMethodA"}}}
                  ]
                }
              }
            ],
            "responses": {
              "200": {
                "description": "JSON-RPC response",
                "schema": {
                  "allOf": [
                    {
                      "type": "object",
                      "required": ["jsonrpc"],
                      "properties": {
                        "id": {"example": "req_id", "type": "string"},
                        "jsonrpc": {"type": "string", "example": "2.0"},
                        "result": {"title": "Result"},
                        "error": {"title": "Error"}
                      }
                    },
                    {"type": "object", "properties": {"result": {"description": "Method result"}}},
                    {
                      "type": "object",
                      "properties": {
                        "error": {"$ref": "#/definitions/Default-Error"}
                      }
                    }
                  ]
                }
              }
            }
          }
        },
        "/BundledMethodB/../my-custom-endpoint": {
          "post": {
            "summary": "\"bundledMethodB\" json-rpc method",
            "operationId": "BundledMethodB",
            "consumes": ["application/json"],
            "produces": ["application/json"],
            "parameters": [
              {
                "in": "body",
                "name": "JsonRpc request",
                "required": true,
                "schema": {
                  "allOf": [
                    {
                      "type": "object",
                      "required": ["jsonrpc", "method"],
                      "properties": {
                        "id": {"example": "req_id", "type": "string"},
                        "jsonrpc": {"type": "string", "example": "2.0"},
                        "method": {"type": "string"},
                        "params": {"title": "Method parameters"}
                      }
                    },
                    {"type": "object", "properties": {"method": {"example": "bundledMethodB"}}}
                  ]
                }
              }
            ],
            "responses": {
              "200": {
                "description": "JSON-RPC response",
                "schema": {
                  "allOf": [
                    {
                      "type": "object",
                      "required": ["jsonrpc"],
                      "properties": {
                        "id": {"example": "req_id", "type": "string"},
                        "jsonrpc": {"type": "string", "example": "2.0"},
                        "result": {"title": "Result"},
                        "error": {"title": "Error"}
                      }
                    },
                    {"type": "object", "properties": {"result": {"description": "Method result"}}},
                    {
                      "type": "object",
                      "properties": {
                        "error": {"$ref": "#/definitions/Default-Error"}
                      }
                    }
                  ]
                }
              }
            }
          }
        }
      },
      "definitions": {
        "ServerError-ParseError-32700": {
          "title": "Parse error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32700}}}
          ]
        },
        "ServerError-InvalidRequest-32600": {
          "title": "Invalid request",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32600}}}
          ]
        },
        "ServerError-MethodNotFound-32601": {
          "title": "Method not found",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32601}}}
          ]
        },
        "ServerError-ParamsValidationsError-32602": {
          "title": "Params validations error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {
              "type": "object",
              "required": ["code", "data"],
              "properties": {
                "code": {"example": -32602},
                "data": {"type": "object", "x-nullable": true, "properties": { "violations": { "type": "array", "x-nullable": true, "items": {"type": "string"}}}}
              }
            }
          ]
        },
        "ServerError-InternalError-32603": {
          "title": "Internal error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {
              "type": "object",
              "required": ["code"],
              "properties": {
                "code": {"example": -32603},
                "data": {
                  "type": "object",
                  "x-nullable": true,
                  "properties": {
                    "_class": {"description": "Exception class", "type": "string", "x-nullable": true},
                    "_code":{"description": "Exception code", "type": "integer", "x-nullable": true},
                    "_message":{"description": "Exception message", "type": "string", "x-nullable": true},
                    "_trace":{"description": "PHP stack trace", "type": "array", "x-nullable": true, "items":{"type": "string"}}
                  }
                }
              }
            }
          ]
        },
        "Default-Error": {
          "allOf": [
            {
              "type": "object",
              "required": ["code", "message"],
              "properties": {
                "code": {
                  "type": "number"
                },
                "message": {
                  "type": "string"
                }
              }
            }, {
              "type": "object",
              "properties": {
                "code": {
                  "type": "integer",
                  "enum": [-32700, -32600, -32601, -32602, -32603]
                }
              }
            }
          ]
        }
      },
      "host": "localhost"
    }
    """

  Scenario: Check that additional information can be added thanks to SwaggerDocCreatedEvent event
    Given I will use kernel with DocCreated listener
    When I send a "GET" request on "/my-custom-doc-endpoint/swagger.json" demoApp kernel endpoint
    Then I should have a "200" response from demoApp with following content:
    """
    {
      "swagger": "2.0",
      "definitions": {
        "ServerError-ParseError-32700": {
          "title": "Parse error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32700}}}
          ]
        },
        "ServerError-InvalidRequest-32600": {
          "title": "Invalid request",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32600}}}
          ]
        },
        "ServerError-MethodNotFound-32601": {
          "title": "Method not found",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {"type": "object", "required": ["code"], "properties": {"code": {"example": -32601}}}
          ]
        },
        "ServerError-ParamsValidationsError-32602": {
          "title": "Params validations error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {
              "type": "object",
              "required": ["code", "data"],
              "properties": {
                "code": {"example": -32602},
                "data": {"type": "object", "x-nullable": true, "properties": {"violations": {"type": "array", "x-nullable": true, "items": {"type": "string"}}}}
              }
            }
          ]
        },
        "ServerError-InternalError-32603": {
          "title": "Internal error",
          "allOf": [
            {"type": "object", "required": ["code", "message"], "properties": {"code": {"type": "number"}, "message": {"type": "string"}}},
            {
              "type": "object",
              "required": ["code"],
              "properties": {
                "code": {"example": -32603},
                "data": {
                  "type": "object",
                  "x-nullable": true,
                  "properties": {
                    "_class": {"description": "Exception class", "type": "string", "x-nullable": true},
                    "_code":{"description": "Exception code", "type": "integer", "x-nullable": true},
                    "_message":{"description": "Exception message", "type": "string", "x-nullable": true},
                    "_trace":{"description": "PHP stack trace", "type": "array", "x-nullable": true, "items":{"type": "string"}}
                  }
                }
              }
            }
          ]
        },
        "Default-Error": {
          "allOf": [
            {
              "type": "object",
              "required": ["code", "message"],
              "properties": {
                "code": {
                  "type": "number"
                },
                "message": {
                  "type": "string"
                }
              }
            }, {
              "type": "object",
              "properties": {
                "code": {
                  "type": "integer",
                  "enum": [-32700, -32600, -32601, -32602, -32603]
                }
              }
            }
          ]
        }
      },
      "host": "localhost",
      "externalDocs": {
        "description": "Find out more about Swagger",
        "url": "http:\/\/swagger.io"
      }
    }
    """
