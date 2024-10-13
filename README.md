# rails-ddd-example

DDD (Domain-Driven Design) is not easy to grasp as there is literally no point in applying it to a small project.

In this repo I'm experimenting with applying DDD principles to a Ruby on Rails project. This is not a fully functional app and can only be interacted with using the rails console.

## MVP Structure

```
├── app
│   ├── modules
│   │   └── product_catalog
│   │       ├── application
│   │       │   ├── add_product_service.rb
│   │       │   ├── delete_product_service.rb
│   │       │   ├── event_handlers
│   │       │   │   ├── on_price_updated_event_handler.rb
│   │       │   │   ├── on_product_created_event_handler.rb
│   │       │   │   ├── on_product_deleted_event_handler.rb
│   │       │   │   └── on_product_updated_event_handler.rb
│   │       │   ├── update_price_service.rb
│   │       │   └── update_product_service.rb
│   │       ├── domain
│   │       │   ├── events
│   │       │   │   ├── price_updated_event.rb
│   │       │   │   ├── product_created_event.rb
│   │       │   │   ├── product_deleted_event.rb
│   │       │   │   └── product_updated_event.rb
│   │       │   ├── price.rb
│   │       │   └── product.rb
│   │       └── persistence
│   │           ├── price_list_repository.rb
│   │           ├── price_record.rb
│   │           ├── product_record.rb
│   │           └── product_repository.rb
```

> Important: At the moment, the assumption is that the reader is familiar with DDD concepts and perhaps not sure how to apply them in Rails.

The proposed structure is as follows:

* **/app/modules** contains the bounded contexts.

* Under each bounded context, i.e. **/app/modules/<bounded_context>/**, we can define all the aggregates, entities, value objects and events (**/app/modules/<bounded_context>/domain/**)

* We can also define the application services that interact directly with the repositories for persistence. This interaction can also happen via event handlers (see **/app/modules/<bounded_context>/application/** and **/app/modules/<bounded_context>/persistence/**.

## Comments

* The class definitions rely on a basic library `ddd_easy` available under `/lib`. The idea is to remove boilerplate and enforce a certain way of doing this instead of re-inventing the wheel. Early stages thinking, I would like to extract it to a proper library one day.

* No event bus or read model is currently implemented as an example.

* Ruby is a dynamic language, and I'm sure some will disagree, but this example would probably work better with Dry types; I think that it can be daunting for some developers, and certainly not a pre-requisite to start
grasping DDD.

## Why DDD?

Because you are not a mere code writer. DDD emphasizes understanding the problem and creating a shared language between domain experts and developers _before_ writing code, rather than focusing solely on the coding process itself. DDD enforces good software engineering practices.

See: https://stackoverflow.com/a/810661
