# VS Code Features and Extensions

## VS Code Out of the Box Features

- [VS Code Shortcuts by Traversy Media](https://www.youtube.com/watch?v=4xA5JePvCJc&list=RDCMUC29ju8bIPH5as8OGnQzwJyA&index=19) runtime 17 min
- [VS Code Keyboard Shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
  
        "Ctrl + /" gives a comment in whatever language you are editing in.
        
        "Ctrl + `" brings up a new terminal.

        Word Wrap "on" via settings. Just search "word wrap".
        
        "Alt" to highlight multiple lines to operate on.
        
        "Alt + Shift" and highlight the paragraph and it will multi highlight each line.

- Lorem is part of VSCode. Lorem20 will give 20 random words in one sentence.

- [Emmet Cheat Sheet](https://docs.emmet.io/cheat-sheet/)
    
    Emmet is part of VSCode. Used when no content is in place.
    
    "! + enter" will give html5 template.

    Some Emmet concepts that use same syntax as CSS:

        + is the sibling selector ex. nav+ul+li gives them as siblings.
  
        > is the child selector ex. nav>ul>>li*6 gives them as children of the previous.

        ^ is the move up action.

        . class

        # id

    Use "Ctrl + Space" to get Emmet back in play.

- [Code faster with Custom VSCode Snippets by Brad Traversy](https://www.youtube.com/watch?v=JIqk9UxgKEc) runtime 21 min
- [Code Snippets Generator for VSCode, Sublime, and Atom](https://snippet-generator.app/)

----

## VS Code Extensions to Download

**Download from Extensions Market Place**

- Markdown All in One by Yu Zhang - preview .md files
- PDF Preview by Analytic Signal Limited
- Material Icon Theme by Philipp Kief - Icon Theme
- One Dark Pro by binaryify - Color Theme
- Prettier-Code Formatter by Prettier
- htmltagwrap by Brad Gashler (Alt + w) - to markup content that is already in place
    - multiple cursors
- Auto Rename Tag by Jun Han - to rename an HTML tag faster
- REST Client by Huachao Mao
- HTML Snippets
- HTML CSS Support
- JavaScript ES6 Snippets
- Live Server by Ritwick Dey - opens in the default browser
- Live Preview by Microsoft - opens in a tab in VSCode
- Auto Import by steotes
- DartJs Sass Compiler and Sass Watcher by CodeLios
- ES 7 React/Redux/ GraphQL/React-Native snippets extension by dsznajder

----

## VS Code and Extension Config Settings

- VS Code Files: 
  - Auto Save: afterdelay
  - Auto Save Delay: 1000 ms
- VS Code Editor:
  - Format on Save: check
  - Format on Save Mode: file
- Auto Import configuration settings:
  - Go to File/Preferences/Settings in VSCode
  - In the settings search type "auto import"
  - In the "Auto Import Configuration"
  - change the "Files to Scan" to {js, jsx, ts, tsx}