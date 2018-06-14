declare 
mark student%rowtype;
total int;
a int:=&a;
cursor c is select * from student where regno=a;
function calc(regno in int,e in int,m in int)
return int
as 
tot int;
begin
tot:=e+m;
return tot;
end;
begin
open c;
loop
fetch c into mark;
exit when c%notfound;
total:=calc(mark.regno,mark.english,mark.mal);
dbms_output.put_line('Reg No: '||mark.regno);
dbms_output.put_line('Name: '||mark.name);
dbms_output.put_line('English: '||mark.english);
dbms_output.put_line('Malayalam : '||mark.mal);
dbms_output.put_line('Total: '||total);
end loop;
close c;
end;
/