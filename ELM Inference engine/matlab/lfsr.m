function next=lfsr(array)
array(1,17)=xor(xor(array(1,1), array(1,2)), xor(array(1,4), array(1,13)));
next=array(1,2:17);
end
