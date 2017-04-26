# 打通 Sidekiq 的任督二脉 Ruby 和 Crystal

> Sidekiq works in ruby together with Crystal

自己整理博文的演示代码，用于演示如何在 Ruby 和 Crystal 两个语言下运行 Sidekiq 并相互执行对方的 worker。

# 使用方法

```bash
$ git clone https://github.com/icyleaf/sidekiq-with-ruby-and-crystal.git
$ cd sidekiq-with-ruby-and-crystal
$ cd crystal && shards update
$ cd ../ruby_on_rails && bundle install
$ cd ..
$ gem install foreman
$ foreman start
```

之后的配合我写的博文服用。

## 文件结构

```bash
.
├── Procfile
├── README.md
├── crystal
│   ├── lib
│   ├── shard.lock
│   ├── shard.yml
│   ├── spec
│   └── src
│       ├── crystal_server.cr           # sidekiq server
│       ├── ruby_client.cr              # 调用 ruby 的 worker
│       ├── web.cr                      # web ui，端口 3120
│       └── workers                     # crystal workers
│           ├── ping1_worker.cr
│           └── ping2_worker.cr
└── ruby_on_rails
    ├── Gemfile
    ├── Gemfile.lock
    ├── Rakefile
    ├── app
    │   ├── assets
    │   ├── controllers
    │   ├── helpers
    │   ├── jobs
    │   ├── models
    │   ├── views
    │   └── workers                     # ruby workers
    │       ├── ping1_worker.rb
    │       └── ping2_worker.rb
    ├── bin
    ├── config
    │   ├── application.rb
    │   ├── boot.rb
    │   ├── database.yml
    │   ├── environment.rb
    │   ├── environments
    │   ├── initializers
    │   │   └── sidekiq.rb              # sidekiq 配置文件
    │   ├── locales
    │   ├── puma.rb
    │   ├── routes.rb
    │   ├── secrets.yml
    │   └── spring.rb
    ├── config.ru
    ├── db
    ├── lib
    ├── log
    ├── public
    ├── tmp
    └── vendor
```