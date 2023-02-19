module nostdir.app;

import std.stdio;
import vibe.vibe;
import std.json : JSONValue;

void lookupHandler(HTTPServerRequest req, HTTPServerResponse resp)
{
	auto queryParameters = req.query();

	// TODO: Insert a check for the key we are looking for
	string username = queryParameters["name"];

	// TODO: JSON to return
	JSONValue json;
	JSONValue namesBlock;

	// TODO: Lookup key here
	string key;
	namesBlock[username] = key;

	json["names"] = namesBlock;
	


	resp.writeBody(json.toPrettyString());
}

void main()
{
	writeln("Edit source/app.d to start your project.");

	// Setup where to listen
	HTTPServerSettings httpSettings = new HTTPServerSettings();
	
	// TODO: Customize these with a config file or environment variables
	httpSettings.port = 8081;

	// Set a GET handler for `/.well-known/nostr.json?<username>`
	URLRouter router = new URLRouter();
	router.get("/.well-known/nostr.json", &lookupHandler);

	// Bind the router to the server
	listenHTTP(httpSettings, router);

	runApplication();

}
