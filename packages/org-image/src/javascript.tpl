/*
 * template to amend our javascript styles for generated spritesheets
 * 
 *  - original template being replaced - https://tinyurl.com/yypunbgr
 *  - config - https://tinyurl.com/y3cukpzp
 *  - motivation - https://tinyurl.com/y5e2p49a
 */

const SPRITES = {
  <% layout.images.forEach(function (image, idx) { if (image.className.indexOf('-') >= 0) { %>'<%= image.className %>'<% } else { %><%= image.className %><% } %>: { x: <%= image.x %>, y: <%= image.y %>, width: <%= image.width %>, height: <%= image.height %> }<% if (idx !== layout.images.length - 1) { %>,<% } %>
  <% }); %>
};

module.exports = SPRITES;