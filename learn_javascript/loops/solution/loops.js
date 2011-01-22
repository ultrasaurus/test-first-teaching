function repeat(s, n) {
	var out = "";
	for (var i = 0; i<n; ++i) {
		out += s;
	}
	return out;
}

function join(a, delimiter) {
	var out = "";
	// for (var i in a) {                   // wrong -- this will grab non-indexed properties
	// for (var i = 0; i<a.length; ++i) {   // wrong -- this will call "length" many times
	for (var i = 0, n=a.length; i<n; ++i) { // right
		out += a[i];
		if (delimiter && i<a.length-1) {
			out += delimiter;
		}
	}
	return out;
}

function sum(a) {
	var total = 0;
	for (var i = 0, n=a.length; i<n; ++i) {
		total += a[i];
	}
	return total;
}

function paramify(hash) {
	var out = [];
	for (var key in hash) {
		if (hash.hasOwnProperty(key)) {
			out.push(key + "=" + hash[key]);
		}
	}
	out.sort();
	s = out.join("&");
	return s;
}
	
