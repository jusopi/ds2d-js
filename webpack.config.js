module.exports = {
	entry: './src/main.coffee',
	output: {
		filename: './src/bundle.js'
	},
	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee-loader" },
			{ test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
		]
	}
}