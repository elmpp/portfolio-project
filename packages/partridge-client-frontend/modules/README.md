The `modules` package attempts to organise UI code into "features". Each feature could 
have 1 or more actual react components.

#### Ducks

When a feature has an "ownership" of local state (i.e. mutating) (via `apollo-link-state`) it will need to expose a number of things to allow `init-apollo` to bootstrap.
Other features need not do this. 