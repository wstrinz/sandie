# Sandie
Sandie is a straightforward API wrapper for the [eval.so](http://eval.so/) [API](http://eval.so/api). Eval.so is a sandboxed code evaluation platform which namely support C#, Ruby, Python, Lua, and even Java!

*Notably, some parts of the API may note work as expected; if so this isn't Sandie's fault. In addition to providing a nice Ruby layer to the eval.so API, (in the future) this project will also test various supported languages from the API.*

## Installation
Install it as `gem install sandie`. Or if you're using Bundler, add `gem 'sandie'` to your Gemfile, and then `bundle`.

## Usage
To evaluate some code, you need to use Sandie's `evaluate` method which takes a Hash splat, like this:
```ruby
sandie = Sandie.new(language: 'ruby')
sandie.evaluate(
  code: 'print "hello world"',
  # input_files: {
  #   'input_file.rb' => 'base64 encoded input file value'
  # },
  compilation_only: false
)
# => {"stdout"=>"hello world\n", "stderr"=>"", "wallTime"=>247, "exitCode"=>0}
```

Here is a table of all the possible keys you can pass to the various `Sandie` methods:

| Method | Key | Type | Description |
| --- | --- | --- | --- |
| `Sandie#new` | `language` | String | *Required* - the language being evaluated. |
| `Sandie#evaluate` | `code` | String | *Required* - the code to evaluate. |
| `Sandie#evaluate` | `input_files` | Hash | Contains files that are placed in the evaluation root. The filename is the *key* and the contents of the file is a *base64 encoded* `value`. |
| `Sandie#evaluate` | `compilation_only` | Boolean | If `true`, only compilation will happen and not execution of the result. Defaults to `false`. |

To list all the available languages that eval.so supports, use Sandie's `languages` method which takes no arguments:
```ruby
sandie.languages
# => {"csharp"=>{"display_name"=>"C#"}, "rust"=>{"display_name"=>"Rust 0.7"}, "clojure"=>{"display_name"=>"Clojure"}, "python2"=>{"display_name"=>"Python 2"}, "idris"=>{"display_name"=>"Idris"}, "chickenscheme"=>{"display_name"=>"Chicken Scheme"}, "jruby18"=>{"display_name"=>"JRuby (1.8 mode)"} (...)
```

## Development
If you'd like to contribute to Sandie or just do some development on it, make sure you fork it, clone it and inside its directory run `bundle`. If you want to run tests, the `Guardfile` is all setup and ready so you can simply run `guard` (or `bundle exec guard`). To run the tests without Guard, run `rspec` (or `bundle exec rspec`). At the end of each run, you'll be told the coverage statistics.

### Contributing
1. Fork the repository.
2. Create a topic branch.
3. Add tests for your unimplemented feature or bug fix.
4. Run `rspec`. If your tests pass return to step 3.
5. Implement your feature or bug fix.
6. Run `rspec`. If your tests fail return to step 5.
7. open `coverage/index.html` in your browser. If your changes are not completely covered by your tests, return to step 3.
8. Add, commit, and push your changes.
9. Submit a pull request.
