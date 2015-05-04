# Engagement
Track when a user is engaging with a page

New school media startups like Buzzfeed measure your attention not
clicks. [Chartbeat's CEO says the average reader spends ~15 seconds](http://time.com/12933/what-you-think-you-know-about-the-web-is-wrong/) on an
article. Don't just record clicks, record engagement.

This module tracks when a user is active on your web site by tracking
mouse movements, scrolling, keyboard presses, and mouse clicks. It's easy to integrate
with your own code to measure custom activity such as watching video.

The module emits a new 'active' signal at most every five seconds. This
is because research has shown that a user on average pays attention to
the page for five seconds after the last scroll/mouse movement/click.

## Install
`npm install engagement`

## How to use
```javascript
var engagement = require('engagement');

engagement.listen = function() {
  // Record engagement event to internal/3rd party analytics system.
};
```

## How to track custom types of engagement e.g. watching video
```javascript
var engagement = require('engagement');

VideoPlayer.on('start', function() {
  interval = setInterval(function(){engagement.active()}, 500);
}
VideoPlayer.on('stop', function() {
  clearInterval(interval);
}
```
