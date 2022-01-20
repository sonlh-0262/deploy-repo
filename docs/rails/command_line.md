### List all rails task

```
bin/rails -T
```

### Code statistic

```
rails stats
```

Trick: make code statistic for custom folder
```
namespace :app do
  task :stats do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ['Builders', 'app/builders']
    ::STATS_DIRECTORIES << ['Decorators', 'app/decorators']
    ::STATS_DIRECTORIES << ['Facades', 'app/facades']
    ::STATS_DIRECTORIES << ['Forms', 'app/forms']
    ::STATS_DIRECTORIES << ['Policies', 'app/policies']
    ::STATS_DIRECTORIES << ['Pdfs', 'app/pdfs']
    ::STATS_DIRECTORIES << ['Services', 'app/services']
    ::STATS_DIRECTORIES << ['Uploaders', 'app/uploaders']
  end
end

rails app:stats
```

### Rails information

```
rails about
```

### List all TODO comment

```
rails notes
```
