<pre>
 _______ __          __                            _______ _______ ___ 
|   _   |  |--.-----|  |_.-----.-----.-----.-----.|   _   |   _   |   |
|.  1   |     |  _  |   _|  _  |  _  |  _  |     ||.  1   |.  1   |.  |
|.  ____|__|__|_____|____|_____|   __|_____|__|__||.  _   |.  ____|.  |
|:  |                          |__|               |:  |   |:  |   |:  |
|::.|                              by stephan.com |::.|:. |::.|   |::.|
`---'                                             `--- ---`---'   `---'
</pre>

© Photopon, LLC
================
#### by stephan.com

This project implements the needed API for Photopon

References
----------

* https://github.com/daddz/sinatra-rspec-bundler-template/
* https://github.com/modernistik/parse-stack-example

Photopon API methods
--------------------

* qrcode
  * company=
  * location=
  * download (optional)
  * t= (nonce for cache, use unix time)
  * size= (optional, forced minimum 128)

Deployment
----------

git push heroku master

Development
-----------

* foreman start

bonus: use rerun https://github.com/alexch/rerun
* `gem install rerun`
* install additional gems for your platform as recommended (rb-fsevent for OSX)
* `rerun foreman start`