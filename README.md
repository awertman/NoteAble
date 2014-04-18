NoteAble
========

#### What is it?

An easy way to create and track comments within an entire directory.

===================================================================================================
#### How do I install it?

To install, in your terminal type: 

		$ gem install noteable

===================================================================================================
#### How do I use it?

Make comments in your file and open and close them with the tags ```##note##```.  For example, in javascript:

	 // ##note## Feature requires additional manipulation to render properly ##note##


To find all the comments in your directory by file, execute NoteAble in your terminal by typing:

		$ noteable

Go to a specific file/comment by typing the id of the file:

		$ noteable <id>


===================================================================================================
#### How do I customize it?

If you want to use your own tag word instead of ```##note##```:

	 $ noteable --t phil

You can then use ```##phil##``` to mark all your notes

<br>

You can set your own key-bindings in Sublime (or other) by...

This binding example will add ```##note## ##note##``` tags with the cursor in the middle with: ```super + .```

```ruby
in Sublime Text 2 > Preferences > Key Bindings - User:

// New note tags with cursor in the middle
{ "keys": ["super+."], "command": "insert_snippet", "args": {"contents": "##note##$0 ##note##"} },
```

This binding example will add ```##note## ##note##``` AROUND a selection when highlighted:

```ruby
in Sublime Text 2 > Preferences > Key Bindings - User:

// Insert note tags around selection
{ "keys": ["super+."], "command": "insert_snippet", "args": {"contents": "##note##${0:$SELECTION}##note##"}, "context":
  [
  { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
  { "key": "selection_empty", "operator": "equal", "operand": false, "match_all": true }
  ]
}
```

===================================================================================================
Made with <3 by Carolyn, James, Phil, Aaron.




