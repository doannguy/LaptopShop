<?php


function jsonResponse($code, $data = [], $message = '')
{
    return response()->json(
        [
            'data' => $data,
            'code' => $code,
            'message' => $message
        ],
        200
    );
}
