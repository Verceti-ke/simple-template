:- begin_tests(st_simple_tokens).

:- use_module(prolog/st/st_simple_tokens).

test(text):-
    st_simple_tokens(`abc`, [text(`abc`)]).

test(out):-
    st_simple_tokens(`{{= abc }}`, [out(abc)]).

test(out_unescaped):-
    st_simple_tokens(`{{- abc }}`, [out_unescaped(abc)]).

test(end):-
    st_simple_tokens(`{{ end }}`, [end]).

test(else):-
    st_simple_tokens(`{{ else }}`, [else]).

test(include):-
    st_simple_tokens(`{{ include file/name }}`, [include(file/name)]).

test(include_var):-
    st_simple_tokens(`{{ include file/name, var }}`, [include(file/name, var)]).

test(dynamic_include):-
    st_simple_tokens(`{{ dynamic_include var }}`, [dynamic_include(var)]).

test(block):-
    st_simple_tokens(`{{ block file/name }}`, [block(file/name)]).

test(block_var):-
    st_simple_tokens(`{{ block file/name, var }}`, [block(file/name, var)]).

test(slot):-
    st_simple_tokens(`{{ slot }}`, [slot]).

test(if):-
    st_simple_tokens(`{{ if x=1 }}`, [if(x=1)]).

test(else_if):-
    st_simple_tokens(`{{ else if x=2 }}`, [else_if(x=2)]).

test(each_1):-
    st_simple_tokens(`{{ each items, item }}`, [each(items, item)]).

test(each_2):-
    st_simple_tokens(`{{ each items, item, index }}`, [each(items, item, index)]).

test(each_3):-
    st_simple_tokens(`{{ each items, item, index, len }}`, [each(items, item, index, len)]).

test(invalid):-
    catch((st_simple_tokens(`{{ invalid`, _), fail), error(invalid_instruction(_)), true).

test(nonground):-
    catch((st_simple_tokens(`{{= A }}`, _), fail), error(non_ground_expression(_)), true).

test(comment):-
    st_simple_tokens(`{{% this is a comment }}`, []).

:- end_tests(st_simple_tokens).
