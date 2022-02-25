# Great Lakes Energy grabber

I wanted my monthly kWh usage and bill as text from my power company.

I emailed them about an API. They told me they had a website. :\ The website is a monster
with OAuth2, generated CSS and loads of javascript.

Sooo this downloads a pdf bill using selenium and a copy of firefox, and has a tool to parse said data with poppler,
and some code to store it as timeseries. It will get run as a job on my server.

* Gotta have GLE_USERNAME and GLE_PASSWORD set.
* Gotta have gecko in your path from here. https://github.com/mozilla/geckodriver/releases/
* Need poppler installed

The docker container takes care of dependencies but weighs in at 1.39GB. The code is extremely brittle
and if GLE changes anything its gonna break. Hopefully having this in a repo is useful to someone else.

![oh well](https://c.tenor.com/WKiLvVFV6BYAAAAd/robert-downey-jr-facepalm.gif)
