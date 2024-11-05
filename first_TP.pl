:- dynamic task/4.
%1. Define necessary predicates to represent tasks.

task(ID, Description, Assignee, Completed).

%2. Implement predicates to create tasks.

create_task(ID, Description, Assignee) :-
    assertz(task(ID, Description, Assignee, false)).

%3. Create a predicate to assign a task to a user.

assign_task(ID, NewAssignee) :-
    retract(task(ID, Description, _, Completed)),
    assertz(task(ID, Description, NewAssignee, Completed)).

%4. Implement a predicate to mark a task as completed.

complete_task(ID) :-
    retract(task(ID, Description, Assignee, _)),
    assertz(task(ID, Description, Assignee, true)).

%5. Define a predicate to display all tasks along with their details ...

display_all_tasks :-
    task(ID, Description, Assignee, Completed),
    format('Task ID: ~w, Description: ~w, Assignee: ~w, Completed: ~w~n', [ID, Description, Assignee, Completed]),
    fail.


%6. Create predicates to display tasks based on specific filters...

%6.1 : User
tasks_by_user(Assignee) :-
    task(ID, Description, Assignee, Completed),
    format('Task ID: ~w, Description: ~w, Completed: ~w~n', [ID, Description, Completed]),
    fail.

%6.2 : completed_tasks
completed_tasks :-
    task(ID, Description, Assignee, true),
    format('Task ID: ~w, Description: ~w, Assignee: ~w~n', [ID, Description, Assignee]),
    fail.

%6.2 :  incomplete_tasks
incomplete_tasks :-
    task(ID, Description, Assignee, false),
    format('Task ID: ~w, Description: ~w, Assignee: ~w~n', [ID, Description, Assignee]),
    fail.


