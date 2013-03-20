ActionDispatch::Callbacks.to_prepare do
  require_dependency 'question_plugin/journal_patch'
  require_dependency 'question_plugin/issue_patch'
  require_dependency 'question_plugin/issue_hooks'
  require_dependency 'question_plugin/layout_hooks'
  require_dependency 'question_plugin/journal_hooks'
  #require_dependency 'question_plugin/queries_helper_patch'
  #require_dependency 'question_plugin/query_patch'
end

Redmine::Plugin.register :question_plugin do
  name 'Question plugin'
  author 'Bishma Stornelli'
  description 'This is a plugin for Redmine that will allow users to ask questions to each other in issue notes'
  version '0.1.0'

  requires_redmine :version_or_higher => '2.2.1'

end

ActiveRecord::Base.observers << :journal_questions_observer
