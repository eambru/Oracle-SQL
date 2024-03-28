set serveroutput on
declare
    type t_num IS TABLE OF NUMBER INDEX BY BINARY_INTEGER; 
    tomb t_num;
    v_sum number;
    v_avg number;

    
    function t_at(v_num t_num ) return number is 
    begin 
        v_sum:=0;
        for i in 1..v_num.count
        loop
            v_sum:=v_sum+v_num(i);
        end loop;
        v_avg:=v_sum/v_num.count;
        return v_avg;
    end t_at;
begin 
    for i in 1..1000
    loop
        tomb(i):= trunc(dbms_random.value(0,2));
    end loop;
    dbms_output.put_line(t_at(tomb)); 
end;