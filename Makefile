paradiddle.min.js : paradiddle.js
	closure-compiler --js paradiddle.js --js_output_file paradiddle.min.js
paradiddle.js :
	coffee --bare --lint --compile paradiddle.coffee
clean :
	rm paradiddle.js paradiddle.min.js
