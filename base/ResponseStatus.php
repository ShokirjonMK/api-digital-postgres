<?php 

namespace base;

class ResponseStatus
{
    /*
        200 OK - Response to a successful GET, PUT, PATCH or DELETE. Can also be used for a POST that doesn't result in a creation.
        201 Created - Response to a POST that results in a creation. Should be combined with a Location header pointing to the location of the new resource
        204 No Content - Response to a successful request that won't be returning a body (like a DELETE request)
        304 Not Modified - Used when HTTP caching headers are in play
        400 Bad Request - The request is malformed, such as if the body does not parse
        401 Unauthorized - When no or invalid authentication details are provided. Also useful to trigger an auth popup if the API is used from a browser
        403 Forbidden - When authentication succeeded but authenticated user doesn't have access to the resource
        404 Not Found - When a non-existent resource is requested
        405 Method Not Allowed - When an HTTP method is being requested that isn't allowed for the authenticated user
        410 Gone - Indicates that the resource at this end point is no longer available. Useful as a blanket response for old API versions
        415 Unsupported Media Type - If incorrect content type was provided as part of the request
        422 Unprocessable Entity - Used for validation errors
        429 Too Many Requests - When a request is rejected due to rate limiting
    */

    const OK = 200;
    const CREATED = 201;
    const NO_CONTENT = 204;
    const NOT_MODIFIED = 304;
    const BAD_REQUEST = 400;
    const UNAUTHORIZED = 401;
    const FORBIDDEN = 403;
    const NOT_FOUND = 404;
    const METHOD_NOT_ALLOWED = 405;
    const GONE = 410;
    const UNSOPPORTED_MEDIA_TYPE = 415;
    const UPROCESSABLE_ENTITY = 422;
    const TOO_MANY_REQUESTS = 422;

}