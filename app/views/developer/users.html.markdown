# Users Documentation

You must be authenticated to use the API. Please see the [authentication documentation](/developer/authentication).

### Example Request
<pre class="pizzazz">
    <strong>curl</strong> -i <span class="string">"http://footballops.org/api/users"</span> \
    -H <span class="string">"Authorization: Bearer 637fe66c9cdd54f3b3c8457453c3ed95"</span>
</pre>

### Example Response
<pre class="pizzazz">
    <span class="headers">HTTP/1.1 200 OK
    Content-Type: application/json; charset=utf-8</span>
</pre>
{{Pizzazz.ify_html(@users)}}
