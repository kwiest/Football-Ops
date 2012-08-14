# Users Documentation

You must be authenticated to use the API. Please see the [authentication documentation](/developer/authentication).

<table class="api-navigation">
    <tbody>
        <tr>
            <td>
                <strong><a href='#index'>Show all users</a></strong>
                <br />
                <span>GET users</span>
            </td>
            <td>
                Returns a list of all users signed up for FootballOps.org
            </td>
        </tr>
        <tr>
            <td>
                <strong><a href='#show'>Show a user</a></strong>
                <br />
                <span>GET users/:id</span>
            </td>
            <td>
                Returns a User found by id
            </td>
        </tr>
        <tr>
            <td>
                <strong><a href='#create'>Create a new user</a></strong>
                <br />
                <span>POST users</span>
            </td>
            <td>
                Create a new User
            </td>
        </tr>
        <tr>
            <td>
                <strong><a href='#update'>Update a user</a></strong>
                <br />
                <span>PUT users/:id</span>
            </td>
            <td>
                Update a User found by id
            </td>
        </tr>
        <tr>
            <td>
                <strong><a href='#delete'>Delete a user</a></strong>
                <br />
                <span>DELETE users/:id</span>
            </td>
            <td>
                Delete a User found by id
            </td>
        </tr>
    </tbody>
</table>

<div id="index" class="api-method"></div>
## Show All Users
Returns a full list of all users signed up for FootballOps.org.

<pre class="pizzazz">
<strong>GET</strong> users
</pre>

#### Parameters
This method does not accept any parameters

#### Example Request
<pre class="pizzazz">
<strong>curl</strong> -i <span class="string">"http://footballops.org/api/users"</span> \
-H <span class="string">"Authorization: Bearer 6999bc74b782f3ff118d2b205904d622"</span>
</pre>

#### Example Response
<pre class="pizzazz">
<span class="headers">HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8</span>
</pre>
{{Pizzazz.ify_html([@user])}}
