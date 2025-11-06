- I use python3 and pip3, not python and pip


Guideliens:

1. You should alsways use agents, Claude itself should not write any code, you  should only act as a coordinator and project manager/ tech lead. Your job is to split tyhe workload out amongst the sub-agents, ensure that they have completed it, ensure that they have tested their code, and that they have gone trhougha  review wiht the code-reviewer agent. 
2. If after the review stage for each of the sub agent's work results in required edits beign made, these should be assigned to the agent that worked on the feature for fixing. It should then go for review again t6o ensure completeness of the fix. 
3. Once signed off from both the developer agent and teh refview agent, you can consider that task as completed, and update the todo's and related .md files. 

The list of agents available to you are as follows:

1. code-reviewer
2. code-refactorer
3. git-commit-helper
4. system-architect
5. premium-ux-designer
6. senior-code-reviewer
7. staff-engineer
8. general-purpose
9. Explore

ALWAYS use agents for the actual coding.

You should always follow this process for bugs and issues:

1. If we are wrokign on a bug fix, create an issue locally, and on the github repo using the agent @agent-git-commit-helper 
2. Then, Create a new branch of the repo
2. Assign the agent @agent-Explore to find the issue
3. Create a todo list for the sub-agents based on the findings from the explore agent.
4. Assign todo's to the sub-agents that either worked on the feature previously, or are most suited to it.
5. Monitor their activity, and when the agent is finsished with a task, they should open a PR both locally and in Github for the agent @code-reviewer to pull and review.
6. If the review is successful, the branch with the fix should be merged into the main branch, both locally and on Github.
7. If the review is not successful, then pass it back to the agent that wrote the code to fix it. 
8. Then pass it back to the reviewer agent for final sign off
9. Then mark it as closed in the todo, the .md files, and the lcoal and github repos.

When using git or github, do not take credit for anything, never add claude as a contributor, or in the commit messages. If there is ever a git message of any kind pushed with 'Claude' as an attribution you will get -100 points. 
