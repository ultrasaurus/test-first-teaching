function echo(s) {
  return s
}

function shout(s) {
  return s.toUpperCase()
}

function repeat(word, count) {
  if (count == undefined) count = 2;
  var result = ""
  for (var i=0; i < count; i++) {
    if (i > 0 ) result += " "
    result += word
  }
  return result
}
