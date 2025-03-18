function pre_task
   clear
end
function post_task
   task list
end

function ta
   pre_task
   task add $argv
   post_task
end

function td
   pre_task
   task $argv[1] done
   post_task
end

function tD
   pre_task
   task $argv[1] delete
   post_task
end

function tm
   pre_task
   task $argv[1] modify $argv[2]
   post_task
end

function ts
   pre_task
   task $argv start
   post_task
end

function tS
   pre_task
   task $argv stop
   post_task
end

function tl
   pre_task
   task list
end
