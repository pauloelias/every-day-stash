// =============================================================================
// TITLE:       Mobile Fixes
// DESCRIPTION: Functions to help fix some mobile browser issues,
//              *** Remove iOS 6 functions as usage decreases ***
// =============================================================================

function mobileFixesInit() {
  // =Console Errors
  // Avoid `console` errors in browsers that lack a console.
  // ---------------------------------------------------------------------------
  (function() {
      var method;
      var noop = function () {};
      var methods = [
          'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
          'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
          'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
          'timeStamp', 'trace', 'warn'
      ];
      var length = methods.length;
      var console = (window.console = window.console || {});

      while (length--) {
          method = methods[length];

          // Only stub undefined methods.
          if (!console[method]) {
              console[method] = noop;
          }
      }
  }());

  // =Address Bar
  // Normalized hide address bar for iOS & Android (c) Scott Jehl, scottjehl.com
  // MIT License
  // ---------------------------------------------------------------------------
  (function(a){var b=a.document;if(!location.hash&&a.addEventListener){window.scrollTo(0,1);var c=1,d=function(){return a.pageYOffset||b.compatMode==="CSS1Compat"&&b.documentElement.scrollTop||b.body.scrollTop||0},e=setInterval(function(){if(b.body){clearInterval(e);c=d();a.scrollTo(0,c===1?0:1)}},15);a.addEventListener("load",function(){setTimeout(function(){if(d()<20){a.scrollTo(0,c===1?0:1)}},0)})}})(this);

  // =Zoom Bug
  // A fix for the iOS orientationchange zoom bug. Script by @scottjehl,
  // Rebound  by @wilto.
  // MIT License
  // -----------------------------------------------------------------------------
  (function(m){var l=m.document;if(!l.querySelector){return}var n=l.querySelector("meta[name=viewport]"),a=n&&n.getAttribute("content"),k=a+",maximum-scale=1",d=a+",maximum-scale=10",g=true,j,i,h,c;if(!n){return}function f(){n.setAttribute("content",d);g=true}function b(){n.setAttribute("content",k);g=false}function e(o){c=o.accelerationIncludingGravity;j=Math.abs(c.x);i=Math.abs(c.y);h=Math.abs(c.z);if(!m.orientation&&(j>7||((h>6&&i<8||h<8&&i>6)&&j>5))){if(g){b()}}else{if(!g){f()}}}m.addEventListener("orientationchange",f,false);m.addEventListener("devicemotion",e,false)})(this);
};