import java.util.LinkedList
q = LinkedList();
q.add('item1');
q.add(2);
q.add([3 3 3]);
item = q.remove();
q.add('item4');
while q.size()>0
    item = q.remove();
    disp(item);
end