# ApiPlayground

To start your new Phoenix application you have to:

1. Install dependencies with `mix deps.get`
2. Start Phoenix router with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.


## Notes

* If you choose to change the application's structure, you could manually start the router from your code like this `ApiPlayground.Router.start`

* the dev and test setup uses a user named "foo" for it to properly work this
user should have the right to create databases and a database named after the
user owned by the user should exist.
(The last bit is needed for ecto.create and ecto.drop to work properly)

