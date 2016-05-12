LanguageSwooleView = require './language-swoole-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageSwoole =
  languageSwooleView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageSwooleView = new LanguageSwooleView(state.languageSwooleViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageSwooleView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-swoole:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageSwooleView.destroy()

  serialize: ->
    languageSwooleViewState: @languageSwooleView.serialize()

  toggle: ->
    console.log 'LanguageSwoole was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
