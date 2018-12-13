# newrelic demo for phx

```bash
$ mix archive.install hex phx_new 1.4.0
$ mix phx_new demo --database=mysql
$ cd demo
$ vi mix.exs
---
 defp deps do
   [
     {:phoenix, "~> 1.4.0"},
     {:phoenix_pubsub, "~> 1.1"},
     {:phoenix_ecto, "~> 4.0"},
     {:ecto_sql, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.11"},
     {:phoenix_live_reload, "~> 1.2", only: :dev},
     {:gettext, "~> 0.11"},
     {:jason, "~> 1.0"},
     {:plug_cowboy, "~> 2.0"},
+    {:new_relic_agent, "~> 1.0"},
+    {:new_relic_phoenix, "~> 0.1"}
   ]
 end
---
$ vi config/dev.exs
---
 config :demo, DemoWeb.Endpoint,
   http: [port: 4000],
   debug_errors: true,
   code_reloader: true,
   check_origin: false,
   watchers: [
     node: [
       "node_modules/webpack/bin/webpack.js",
       "--mode",
       "development",
       "--watch-stdin",
       cd: Path.expand("../assets", __DIR__)
     ]
   ],
+  instrumenters: [NewRelic.Phoenix.Instrumenter]

〜

+ config :new_relic_agent,
+   app_name: "<YOUR APP>",
+   license_key: "<YOUR KEY>"
---
```
