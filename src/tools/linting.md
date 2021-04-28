# Linting

## Markdown

We've selected the npm package `markdownlint-cli` for linting markdown ([package](https://www.npmjs.com/package/markdownlint-cli)).

Rulesets can be found [here](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md).

### Installation and use

Generally, for determinism, it's best not to install global versions of npm packages. Rather than installing the cli tool globally, initiate a `package.json` file and in your project with:

```shell
npm init
npm install markdownlint-cli
```

For CI or terminal use, add a command to the `scripts` section of `package.json`:

```json
"scripts": {
    "lint:markdown": "markdownlint '**/*.md' --ignore node_modules -c .markdownlint.json"
}
```

The flag `-c` is pointing to a config file, in this case `.markdownlint.json`, which is at root in the example to automatically configure any IDE plugins (plugins may need special config to load the config file from another location).

#### Automated fixes

Where no IDE integration is possible, `markdownlint` fixes can be automated as follows:

```json
"scripts": {
    "fix:markdown": "markdownlint '**/*.md' --fix --ignore node_modules -c .markdownlint.json"
}
```

### Configuration

`markdownlint-cli` can be configured using a variety of file formats ([see docs for the selection](https://www.npmjs.com/package/markdownlint-cli)). This is what, for example, a `.markdownlint.json` file might look like:

```json
{
    "default": true,
    "MD013": false
}
```

In this case, the standard config is being imported and the rule for line lengths is being disabled. Rulesets can be found [here](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md).

### IDE Support

#### VS Code

Plugin support for VSCode can be found in the marketplace under the name `markdownlint` (ID: davidanson.vscode-markdownlint). This will provide highlighting by default.

From [the setup guide](https://github.com/DavidAnson/vscode-markdownlint), to add autofix on save, configure VS Code's editor.codeActionsOnSave settings:

```json
"editor.codeActionsOnSave": {
    "source.fixAll.markdownlint": true
}
```
