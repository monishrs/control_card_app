
// .map, .when, .maybeMap, and .maybeWhen are all used to handle the current state in your UI screen, especially in widgets like: BlocBuilder,BlocConsumer,BlocListener

return state.when(
  initial: () => const Text("Initial state"),
  loading: () => const CircularProgressIndicator(),
  success: (articleEntity) => Text("Loaded ${articleEntity.articles?.length ?? 0} articles"),
  error: (errorCode) => Text("Error: ${errorCode?.name}"),
);
✅ Use this when you're directly using values (like articleEntity, errorCode) — simple and readable.


return state.map(
  initial: (_) => const Text("Initial state"),
  loading: (_) => const CircularProgressIndicator(),
  success: (state) {
    final articles = state.articleEntity.articles ?? [];
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(articles[index].title ?? 'No Title'));
      },
    );
  },
  error: (state) => Text("Error: ${state.error?.name}"),
);
✅ Use this when you want access to the whole object, not just the constructor parameters.


return state.maybeWhen(
  success: (articleEntity) => Text("Loaded ${articleEntity.articles?.length ?? 0} articles"),
  orElse: () => const CircularProgressIndicator(),
);
✅ Use this when you want to react to only one or two states, and ignore others safely.


return state.maybeMap(
  error: (state) => Text("Something went wrong: ${state.error?.name}"),
  orElse: () => const Text("Waiting..."),
);
✅ Use this when:You only care about specific states,You need full object access for the states you do care about


//use of builder and listner
| Thing      | What it does                    |
| ---------- | ------------------------------- |
| `builder`  | “What should the user **see**?” |
| `listener` | “What should the app **do**?”   |

