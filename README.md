NoteAble
========

#### What is it?

An easy way to create and track comments within an entire directory.

===================================================================================================
#### How do I install it?

To install, in your terminal type: 

		gem install noteable

===================================================================================================
#### How do I use it?

Make comments in your file and open and close them with the tags ```##note##```.  For example, in javascript:

	 // ##note## Feature requires additional manipulation to render properly ##note##


To find all the comments in your directory by file, execute NoteAble in your terminal by typing:

		noteable

Go to a specific file/comment by typing the id of the file:

		noteable <id>

You can set your own key-bindings in Sublime (or other) with the following code ( e.g. super + . ):

```ruby
// New note tags with cursor in the middle
{ "keys": ["super+."], "command": "insert_snippet", "args": {"contents": "##note##$0 ##note##"} },

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




