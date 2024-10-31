syntax match CommitReplaceAdd "\v\+\+\+.*$"
syntax match CommitReplaceRm "\v^---.*$"
syntax match CommitAdd "\v^\+(\+)@!.*$"
syntax match CommitRm "\v^-(-)@!.*$"
syntax match CommitChange "\v^\@\@.*$"
hi CommitChange ctermbg=14
hi CommitReplaceAdd ctermbg=7
hi CommitReplaceRm ctermbg=7
hi CommitAdd ctermbg=10
hi CommitRm ctermbg=9
